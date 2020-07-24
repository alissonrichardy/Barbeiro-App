import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barbeiroapp/service/servico.dart' as service;
import 'package:barbeiroapp/model/servico_model.dart' as ServicoModel;
import 'package:barbeiroapp/userInfo.dart' as user;

List<dynamic> listServico = [];

class ServicosPage extends StatefulWidget {
  @override
  _ServicosPageState createState() => _ServicosPageState();
}

class _ServicosPageState extends State<ServicosPage> {
  Future<List<dynamic>> getServicos() async {
    bool sucesso = false;
    try {
      List<dynamic> lista = await service.carregarServicos();
      listServico = [];
      lista.forEach((ls) => {
            listServico.add(new ServicoModel.Servico(
                ls['id'], ls['nome'], ls['duracao'], ls['pontos'], ls['valor']))
          });
      sucesso = true;
    } catch (e) {
      print(e);
    } finally {
      if (!sucesso) {
        print("nao teve sucesso ao buscar dados");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // print("informações usuarios: " + user.userInfo.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1E1E1E), //Color(0XFF1E1E1E),
      appBar: new AppBar(
        title: new Text("Serviços",
            style: TextStyle(
              fontFamily: 'editundo',
              color: Colors.white,
              fontSize: 35.0,
              // fontWeight: FontWeight.bold
            )),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getServicos(),
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
                  itemCount: listServico.length,
                  itemBuilder: cardServico,
                );
          }
        },
      ),
    );
  }
}

Widget cardServico(BuildContext context, int index) {
  var _size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.only(
        top: _size.height * .01, bottom: _size.height * .01, left: 5, right: 5),
    child: Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        //color: Colors.green,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Color(0xFF3A3939)),
        child: Align(
          alignment: Alignment(0.9, 0.0),
          child: Text(
            "Agendar",
            style: TextStyle(
                color: Color(0xFFE2D9D9),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => AgendamentoPage()));
        Navigator.pushReplacementNamed(context, '/agendamento', arguments: {
          'id': listServico[index].getId(),
          'nome': listServico[index].getNome(),
        });
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
                listServico[index].getNome(),
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
                      listServico[index].getTempo().toString() + " min",
                      style: new TextStyle(
                          color: Color(0xFFD2D2D2),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    new Text(
                      "R\$ " + listServico[index].getPreco().toString(),
                      style: new TextStyle(
                          color: Color(0xFFE2D9D9),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    new Text(
                      listServico[index].getPontos().toString() + " pts",
                      style: new TextStyle(
                          color: Color(0xFFD2D2D2),
                          fontWeight: FontWeight.bold),
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
