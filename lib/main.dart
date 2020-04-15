import 'package:barbeiroapp/pages/agendamento_page.dart';
import 'package:barbeiroapp/pages/login_page.dart';
import 'package:barbeiroapp/pages/register_page.dart';
import 'package:barbeiroapp/pages/servicos_page.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(

    home: new AgendamentoPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      hintColor: Colors.deepPurpleAccent,
      primaryColor: Colors.black,
    ),
  ));
}
