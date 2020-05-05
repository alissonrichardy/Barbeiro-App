import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:barbeiroapp/service/login.dart' as service;
import 'package:barbeiroapp/userInfo.dart' as user;

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}



class _LoadingState extends State<Loading> {
  Map data = {};

  void logar(Map data) async {
    Map<String, dynamic> userInfo;
    String proxRota = data["nextRota"];
    String backRota = data['backRota'];

    if (proxRota.isNotEmpty) {
      try {
        userInfo = await service.verificarLogin(data['email'], data['senha']);
        print(userInfo);
        user.userInfo = userInfo;
      } catch (error) {
        print(error);
      } finally {
        if (userInfo != null) {
          print("direcionado para pagina de home");
          Navigator.pushReplacementNamed(context, proxRota);
        } else {
          print("retornando a pagina de login");
          Navigator.pushReplacementNamed(context, backRota);
        }
      }
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void register(Map data) async {
    bool registrado = false;
    String proxRota = data["nextRota"];
    String backRota = data['backRota'];

    if (proxRota.isNotEmpty) {
      try {
        registrado = await service.registerUser(
            data['email'], data['senha'], data["nome"]);
      } catch (error) {
        print("erro ao registrar");
      } finally {
        if (registrado) {
          print("direcionado para proxima rota");
          Navigator.pushReplacementNamed(context, proxRota);
        } else {
          print("retornando a rota");
          Navigator.pushReplacementNamed(context, backRota);
        }
      }
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    if (data['register'] != null && data['register'] == true) {
      register(data);
    } else {
      logar(data);
    }

    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SpinKitFadingFour(color: Colors.red, size: 50.0),
        ));
  }
}
