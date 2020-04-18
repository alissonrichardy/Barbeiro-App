import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:barbeiroapp/service/login.dart' as service;

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map data = {};
  
  void logar(Map data) async {
    bool logado = false;
    try {
      logado = await service.verificarLogin(data['email'], data['senha']);
    } catch (error) {
      print("erro ao logar");
    } finally {
      if (logado) {
        print("direcionado para pagina de home");
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        print("retornando a pagina de login");
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    logar(data);

    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SpinKitFadingFour(color: Colors.red, size: 50.0),
        ));
  }
}
