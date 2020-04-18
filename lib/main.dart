import 'package:barbeiroapp/pages/agendamento_page.dart';
import 'package:barbeiroapp/pages/home_page.dart';
import 'package:barbeiroapp/pages/loading.dart';
import 'package:barbeiroapp/pages/login_page.dart';
import 'package:barbeiroapp/pages/register_page.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginPage(),
      '/register': (context) => RegisterPage(),
      '/home': (context) => HomePage(),
      '/loading': (context) => Loading(),
    }
    ,

   // home: new LoginPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      hintColor: Colors.deepPurpleAccent,
      primaryColor: Colors.black,
    ),
  ));
}
