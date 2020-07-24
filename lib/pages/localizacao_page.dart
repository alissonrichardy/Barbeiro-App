import 'package:flutter/material.dart';

class LocalPage extends StatefulWidget {
  @override
  _LocalPageState createState() => _LocalPageState();
}

class _LocalPageState extends State<LocalPage> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Localização",
            style: TextStyle(
              fontFamily: 'editundo',
              color: Colors.white,
              fontSize: 35.0,
              // fontWeight: FontWeight.bold
            )),
        centerTitle: true,
        backgroundColor: Colors.black, // Color(0xFF3A3939)
      ),
      backgroundColor: Color(0xFF3A3939),
      body: new ListView(
        children: <Widget>[
          SizedBox(
            height: _size.height * .01,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: _size.width * .95,
                height: 300,
                decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    image: new DecorationImage(
                        image: AssetImage("images/outras/localizacao.png"),
                        fit: BoxFit.fill)),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          new Center(
            child: RaisedButton(
              onPressed: () {
                print("ir para google maps");
                // Navigator.pushReplacementNamed(context, '/agenda');
              },
              color: Colors.white24,
              child: Text(
                "Ver no Google Maps",
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
}
