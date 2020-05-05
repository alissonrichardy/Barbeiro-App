import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';



Future<Map<String, dynamic>> verificarLogin(String email, String senha) async {
  String _url = "http://10.0.2.2:8080/login";

  Map login = {"email": email, "senha": senha};
  http.Response response;
  response = await http.put(_url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(login));
  return json.decode(response.body);
}


Future<bool> registerUser(String email, String senha, String nome) async {
  String _url = "http://10.0.2.2:8080/cliente";

  Map resgister = {"email": email, "senha": senha, "nome": nome};
  http.Response response;
  response = await http.post(_url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(resgister));
  return json.decode(response.body);
}
