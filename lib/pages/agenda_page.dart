import 'package:barbeiroapp/service/agendamento.dart';
import 'package:flutter/material.dart';
import 'package:barbeiroapp/model/agendamento_model.dart' as model;

DateTime data = new DateTime.now();
List<model.Agendadamento> listaAgendamentos = [];

DateTime convertDateFromString(String strDate) {
  DateTime todayDate = DateTime.parse(strDate);
  //print(todayDate);
  //print(formatDate(todayDate, [yyyy, '/', mm, '/', dd, ' ', hh, ':', nn, ':', ss, ' ', am]));
  return todayDate;
}

class AgendaPage extends StatefulWidget {
  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  Future<List<dynamic>> getAgendamentos() async {
    listaAgendamentos = [];
    List<dynamic> dados;
    try {
      dados = await getAgendamentosByIdCliente();
      dados.forEach((ls) => {
            listaAgendamentos.add(new model.Agendadamento(
                ls["id"],
                convertDateFromString(ls["dataAgendamento"]),
                ls["nomeServico"],
                ls["nomeCliente"])),
          });
    } catch (error) {} finally {}
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda",
            style: TextStyle(
              fontFamily: 'editundo',
              color: Colors.white,
              fontSize: 35.0,
              // fontWeight: FontWeight.bold
            )),
        centerTitle: true,
      ),
      backgroundColor: Color(0XFF1E1E1E),
      body: FutureBuilder(
        future: getAgendamentos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 5.0,
                  ),
                ),
              );
            default:
              if (snapshot.hasError)
                return Container(
                  width: 200.0,
                  height: 200.0,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    strokeWidth: 5.0,
                  ),
                );
              else
                return new ListView.builder(
                  padding: EdgeInsets.only(top: 10),
                  itemCount: listaAgendamentos.length,
                  itemBuilder: cardAgenda,
                );
          }
        },
      ),
    );
  }
}

Widget cardAgenda(BuildContext context, int index) {
  var _size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.only(
        top: _size.height * .01, bottom: _size.height * .01, left: 5, right: 5),
    child: Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Color(0xFF3A3939)),
        child: Align(
          alignment: Alignment(0.9, 0.0),
          child: Text(
            "Cancelar",
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => AgendamentoPage()));
        deleteAgendamento(listaAgendamentos[index].id);
      },
      child: new Container(
        height: 100.0,
        decoration: new BoxDecoration(
            color: Color(0xFF3A3939),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0)),
        child: new Center(
            child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: 200.0,
              child: new Text(
                listaAgendamentos[index].nomeServico,
                style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD2D2D2)),
              ),
            ),
            SizedBox(
              width: 30.0,
            ),
            new Expanded(
                child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: new Container(
                height: 90.0,
                decoration: new BoxDecoration(
                    // borderRadius: new BorderRadius.circular(100.0),
                    //  color: Colors.black),
                    ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      listaAgendamentos[index].dataAgendamento.day.toString() +
                          "/" +
                          listaAgendamentos[index]
                              .dataAgendamento
                              .month
                              .toString(),
                      style: new TextStyle(
                          color: Color(0xFFE2D9D9),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    new Text(
                      listaAgendamentos[index].dataAgendamento.hour.toString() +
                          ":" +
                          listaAgendamentos[index]
                              .dataAgendamento
                              .minute
                              .toString(),
                      style: new TextStyle(
                          color: Color(0xFFE2D9D9),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            )),
          ],
        )),
      ),
    ),
  );
}
