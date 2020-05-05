import 'package:flutter/material.dart';
import 'package:barbeiroapp/model/servico_model.dart' as ServicoModel;

class AgendamentoPage extends StatefulWidget {
  @override
  _AgendamentoPageState createState() => _AgendamentoPageState();
}

class _AgendamentoPageState extends State<AgendamentoPage> {
  Map data;
  Map servico= {};


  DateTime dataAgendamento = DateTime.now();

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    if(data != null) {
       servico = {"id": data['id'], "nome": data['nome']};

      return Scaffold(
        appBar: new AppBar(
          title: Text("Agendar Serviço"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Color(0XFF1E1E1E),
        body: ListView(
          padding: EdgeInsets.only(top: 10.0),
          children: <Widget>[
            new Center(
              child: Text(
                //"Corte + Barba",
                servico["nome"],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            // Container
            new Center(
              child: new Container(
                height: 365.0,
                width: 320.0,
                decoration: new BoxDecoration(
                    color: Color(0xFF3A3939),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: <Widget>[
                    // title dia
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "DIA",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    //Dias
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          width: 250.0,
                          height: 150.0,
                          decoration: new BoxDecoration(
                              color: Color(0XFF1E1E1E),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            children: <Widget>[

                              SizedBox(
                                height: 25,
                              ),

                              new Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF1E1E1E),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomRight: Radius.circular(
                                                    10),
                                                bottomLeft: Radius.circular(
                                                    10)),
                                            border: Border.fromBorderSide(
                                                BorderSide(
                                                    color: Colors.white))),
                                        child: Center(
                                            child: FlatButton(
                                              onPressed: () {
                                                print("ok");
                                              },
                                              child: Text(
                                                  dataAgendamento.day
                                                      .toString() + "\\" +
                                                      dataAgendamento.month
                                                          .toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20.0,
                                                      fontWeight: FontWeight
                                                          .bold)),
                                            ))),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 10.0,
                              ),

                              new Center(
                                child: RaisedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return DayPicker(
                                            selectedDate: DateTime.now(),
                                            currentDate: DateTime.now(),
                                            onChanged: (time) {
                                              Navigator.of(context).pop();
                                              setState(() {
                                                // dayPicker = time;
                                                dataAgendamento = time;
                                                print(time.day);
                                              });
                                            },
                                            firstDate: DateTime.utc(
                                              DateTime
                                                  .now()
                                                  .year,
                                              DateTime
                                                  .now()
                                                  .month,
                                              DateTime
                                                  .now()
                                                  .day,
                                            ),
                                            lastDate: DateTime.utc(
                                              DateTime
                                                  .now()
                                                  .year,
                                              DateTime
                                                  .now()
                                                  .month,
                                              31,
                                            ),
                                            selectableDayPredicate: (time) {
                                              //print(time);
                                              return true;
                                            },
                                            displayedMonth: DateTime.now());
                                      },
                                    );
                                  },
                                  color: Colors.green,
                                  child: Text(
                                    "Selecionar Dia",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )

                            ],
                          ),
                        )
                      ],
                    ),

                    // HORARIO
                    SizedBox(
                      height: 10.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "Horário",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          width: 300.0,
                          height: 150.0,
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            children: <Widget>[

                              new Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF1E1E1E),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10)),
                                            border: Border.fromBorderSide(
                                                BorderSide(
                                                    color: Colors.white))),
                                        child: Center(
                                          child: Text("08:00",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold)),
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF1E1E1E),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10)),
                                            border: Border.fromBorderSide(
                                                BorderSide(
                                                    color: Colors.white))),
                                        child: Center(
                                          child: Text("08:30",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold)),
                                        )),
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF1E1E1E),
                                            border: Border.fromBorderSide(
                                                BorderSide(
                                                    color: Colors.white))),
                                        child: Center(
                                          child: Text("09:00",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold)),
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF1E1E1E),
                                            border: Border.fromBorderSide(
                                                BorderSide(
                                                    color: Colors.white))),
                                        child: Center(
                                          child: Text("09:30",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold)),
                                        )),
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF1E1E1E),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                Radius.circular(10.0)),
                                            border: Border.fromBorderSide(
                                                BorderSide(
                                                    color: Colors.white))),
                                        child: Center(
                                          child: Text("10:00",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold)),
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF1E1E1E),
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                Radius.circular(10.0)),
                                            border: Border.fromBorderSide(
                                                BorderSide(
                                                    color: Colors.white))),
                                        child: Center(
                                          child: Text("10:30",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold)),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // Ação
            new Center(
              child: RaisedButton(
                onPressed: () {},
                color: Colors.green,
                child: Text(
                  "Realizar Agendamento",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      );
    }
    else{
      return new Container(

      );
    }
  }
}
/*
      servico = new ServicoModel.Servico(
          data['id'], data['nome'], data['duracao'], data['pontos'],
          data['valor']);
 */