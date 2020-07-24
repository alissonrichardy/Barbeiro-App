import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NovoServicoPage extends StatefulWidget {
  @override
  _NovoServicoPageState createState() => _NovoServicoPageState();
}

class _NovoServicoPageState extends State<NovoServicoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber, //Color(0XFF1E1E1E),
      appBar: new AppBar(
        title: new Text("Novo Serviço"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height:  200,
            child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (dateTime) {
                  print(dateTime);
                }),
          )
        ],
      ),
    );
  }
}
