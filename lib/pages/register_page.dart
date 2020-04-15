import 'package:barbeiroapp/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                        decoration: new InputDecoration(
                          labelText: 'E-mail',
                          labelStyle: TextStyle(
                              color: Color(0xFF707070),
                              fontWeight: FontWeight.bold),
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
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          labelText: 'Nome',
                          labelStyle: TextStyle(
                              color: Color(0xFF707070),
                              fontWeight: FontWeight.bold),
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
                        decoration: new InputDecoration(
                          labelText: 'Senha',
                          labelStyle: TextStyle(
                              color: Color(0xFF707070),
                              fontWeight: FontWeight.bold),
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
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: new Container(
                      height: 50.0,
                      width: 150,
                      decoration: new BoxDecoration(
                        color: Color(0xFF000000),
                        borderRadius: new BorderRadius.circular(35.0),
                      ),
                      alignment: Alignment.center,
                      child: new Text(
                        "Cadastrar",
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Color(0XFF707070),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new SizedBox(
              height: 30.0,
            ),

            new Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Center(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "Já tem registro? ",
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Color(0XFF707070),
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));},
                        child: new Text(
                        "clique Aqui.",
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                ))
          ],
        ));
  }
}
