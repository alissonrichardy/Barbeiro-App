import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

String _url = "http://10.0.2.2:8080/servico";
//String _url = "http://127.0.0.1:8080/servico";

Future<List<dynamic>> carregarServicos() async {
  http.Response response;
  response = await http.get(_url);
  return  json.decode(response.body);
}
