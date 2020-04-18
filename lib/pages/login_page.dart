import 'package:barbeiroapp/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:barbeiroapp/service/agendamento.dart' as service;
import 'package:barbeiroapp/service/login.dart' as service;



class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  Future<bool> logar(String email, String senha) async{
    bool resultado = await service.verificarLogin(email, senha);
    if (resultado){
      print("entrou");
    }
    else{
      print("não entrou");
    }
    return resultado;
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Color(0XFF1E1E1E), //Color(0XFF1E1E1E),
        body: new ListView(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Expanded(
                  child: Container(
                    height: 200,
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(5.0),
                        color: Color(0XFF1E1E1E),
                        image: new DecorationImage(
                            image: AssetImage('images/logo1.png'),
                            fit: BoxFit.cover /*cover */)),
                  ),
                )
              ],
            ),
            new SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new Row(
                children: <Widget>[
                  Expanded(
                    child: new TextFormField(
                        style: new TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        controller: emailController,

                        decoration: new InputDecoration(
                          labelText: 'E-mail',
                          labelStyle: TextStyle(color: Color(0xFF707070), fontWeight: FontWeight.bold),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.red)),
                        )),
                  ),
                ],
              ),
            ),
            new SizedBox(
              height: 15.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new Row(
                children: <Widget>[
                  Expanded(
                    child: new TextFormField(
                        style: new TextStyle(color: Colors.white),
                        obscureText: true,
                        textAlign: TextAlign.center,
                        controller: senhaController,

                        decoration: new InputDecoration(
                          labelText: 'Senha',
                          labelStyle: TextStyle(color: Color(0xFF707070),  fontWeight: FontWeight.bold),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.red)),
                        )),
                  ),
                ],
              ),
            ),
            new SizedBox(
              height: 30.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/loading', arguments: {
                        'email': emailController.text,
                        'senha': senhaController.text
                      });
                    },
                    child: new Container(
                      height: 50.0,
                      width: 150,
                      decoration: new BoxDecoration(
                        color: Color(0xFF000000),
                        borderRadius: new BorderRadius.circular(35.0),
                      ),
                      alignment: Alignment.center,
                      child: new Text(
                        "Entrar",
                        style:
                            new TextStyle(fontSize: 20.0, color: Color(0XFF707070), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new SizedBox(
              height: 70.0,
            ),
            Center(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Esqueci a senha...",
                    style: new TextStyle(fontSize: 20.0, color: Color(0XFF707070),  fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            new Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Center(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "Não tem registro? ",
                        style: new TextStyle(fontSize: 20.0, color: Color(0XFF707070), fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                          Navigator.pushReplacementNamed(context, '/register', arguments: {
                            'location': "brasil",
                            'flag': "instance.flag",
                            'time': "instance.time"
                          });
                          },
                        child: new Text(
                        "clique Aqui.",
                        style: new TextStyle(fontSize: 20.0, color: Colors.white,  fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                )),



          ],
        ));
  }
}
