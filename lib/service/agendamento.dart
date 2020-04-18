import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map> getAgendamentos() async {
  http.Response response;
  response = await http.get("http://10.0.2.2:8080/agendamento");
  print(json.decode(response.body));
  return null;
}
