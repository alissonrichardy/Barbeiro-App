import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

String _url = "http://10.0.2.2:8080/login";

Future<bool> verificarLogin(String email, String senha) async {
  Map login = {"email": email, "senha": senha};
  http.Response response;
  response = await http.put(_url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(login));
  return json.decode(response.body);
}
