import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ipservidor.dart';

//String _url = "http://10.0.2.2:8080/servico";

Future<List<dynamic>> carregarServicos() async {
  http.Response response;
  response = await http.get(urlServidor + "servico");
  return  json.decode(response.body);
}
