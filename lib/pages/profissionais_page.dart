import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<dynamic> listaProfissionais = [
  {
    "id": 1,
    "nome": "JHON DO CORTE RÁPIDO",
    "experiencia":
        "Barbeiro com mais de 15 anos de experiência, trabalhou na barbearia x, y e z mais texto ",
    "foto": "images/barbeiros/barber03.jpg"
  },
  {
    "id": 1,
    "nome": "RICK MIL CORTES",
    "experiencia":
        "Profissional com mais de 15 anos de experiência, trabalhou na barbearia x, y e z mais texto ",
    "foto": "images/barbeiros/barber01.jpg"
  },
  {
    "id": 1,
    "nome": "STIVE CORTA TUDO",
    "experiencia":
        "Barbeiro com mais de 15 anos de experiência, trabalhou na barbearia x, y e z mais texto ",
    "foto": "images/barbeiros/barber02.png"
  }
];

class ProfissionaisPage extends StatefulWidget {
  @override
  _ProfissionaisPageState createState() => _ProfissionaisPageState();
}

class _ProfissionaisPageState extends State<ProfissionaisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Profissionais",
            style: TextStyle(
              fontFamily: 'editundo',
              color: Colors.white,
              fontSize: 35.0,
              // fontWeight: FontWeight.bold
            )),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF1E1E1E),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: listaProfissionais.length,
        itemBuilder: cardProfissional,
      ),
    );
  }
}

Widget cardProfissional(BuildContext context, int index) {
  var _size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.only(
        top: _size.height * .015,
        bottom: _size.height * .015,
        left: 5,
        right: 5),
    child: new Container(
        height: _size.height / 4,
        decoration: new BoxDecoration(
            color: Color(0xFF3A3939),
            border: Border.all(color: Color(0xFFFFEBEB)),
            borderRadius: BorderRadius.circular(25.0)),
        child: Container(
          child: Row(
            children: <Widget>[
              Container(
                  width: _size.width * .65,
                  child: Column(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: new Text(
                          listaProfissionais[index]["nome"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD2D2D2)),
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: new Text(
                          "Experiência:",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD2D2D2)),
                        ),
                      ),
                      new Padding(
                          padding: EdgeInsets.only(left: 5, right: 10, top: 2),
                          child: Text(listaProfissionais[index]["experiencia"],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFD2D2D2))))
                    ],
                  )),
              new Expanded(
                  child: new Container(
                height: _size.height / 4.5,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      image: AssetImage(listaProfissionais[index]["foto"]),
                      fit: BoxFit.cover),
                ),
              ))
            ],
          ),
        )),
  );
}
