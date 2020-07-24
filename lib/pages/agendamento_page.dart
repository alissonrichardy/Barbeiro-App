import 'package:barbeiroapp/service/agendamento.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barbeiroapp/model/servico_model.dart' as ServicoModel;

class AgendamentoPage extends StatefulWidget {
  @override
  _AgendamentoPageState createState() => _AgendamentoPageState();
}

class _AgendamentoPageState extends State<AgendamentoPage> {
  Map data;
  Map servico = {};

  DateTime dataMaxima = DateTime.now();
  DateTime dataAgendamento = DateTime.now();

  int limitDiasAgendamento = 30;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    if (data != null) {
      servico = {"id": data['id'], "nome": data['nome']};

      return Scaffold(
        appBar: new AppBar(
          title: Text("Agendar Serviço",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Color(0XFF1E1E1E),
        body: ListView(
          padding: EdgeInsets.only(top: 10.0),
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
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
              height: 20.0,
            ),

            // Container
            new Center(
              child: new Container(
                height: 400.0,
                width: 400.0,
                decoration: new BoxDecoration(
                    color: Colors.white24, //Color(0xFF3A3939)
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 400,
                      child: CupertinoDatePicker(
                          minimumDate: dataMaxima,
                          initialDateTime: dataAgendamento,
                          use24hFormat: true,
                          mode: CupertinoDatePickerMode.dateAndTime,
                          maximumDate: new DateTime(
                              dataMaxima.year,
                              dataMaxima.month,
                              dataMaxima.day + limitDiasAgendamento,
                              dataMaxima.hour,
                              dataMaxima.minute,
                              dataMaxima.second,
                              dataMaxima.millisecond,
                              dataMaxima.microsecond),
                          onDateTimeChanged: (dateTime) {
                            print(dateTime);
                            setState(() {
                              dataAgendamento = dateTime;
                            });
                          }),
                    ),

                    /*
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
                                                bottomRight:
                                                    Radius.circular(10),
                                                bottomLeft:
                                                    Radius.circular(10)),
                                            border: Border.fromBorderSide(
                                                BorderSide(
                                                    color: Colors.white))),
                                        child: Center(
                                            child: FlatButton(
                                          onPressed: () {
                                            print("ok");
                                          },
                                          child: Text(
                                              dataAgendamento.day.toString() +
                                                  "\\" +
                                                  dataAgendamento.month
                                                      .toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold)),
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
                                                print(time);
                                              });
                                            },
                                            firstDate: DateTime.utc(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              DateTime.now().day,
                                            ),
                                            lastDate: DateTime.utc(
                                              DateTime.now().year,
                                              DateTime.now().month,
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

                     */
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // Ação,
            new Center(
              child: RaisedButton(
                onPressed: () async {
                  print("relizando agendamento");

                  await agendarServico(servico["id"], dataAgendamento);
                  print(servico["id"]);
                  Navigator.pushReplacementNamed(context, '/agenda');
                },
                color: Colors.white24,
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
    } else {
      return new Container();
    }
  }
}
