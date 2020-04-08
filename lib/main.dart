import 'package:barbeiroapp/pages/login_page.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(

    home: new LoginPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      hintColor: Colors.deepPurpleAccent,
      primaryColor: Colors.black,
    ),
  ));
}