import 'package:barbeiroapp/userInfo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ipservidor.dart';

Future<Map> getAgendamentosAll() async {
  http.Response response;
  //response = await http.get("http://10.0.2.2:8080/agendamento");
  response = await http.get( urlServidor + "agendamento");
  print(json.decode(response.body));
  return null;
}

Future<List<dynamic>> getAgendamentosByIdCliente() async {
  http.Response response;
  //response = await http.get("http://10.0.2.2:8080/agendamento/" + userInfo["id"].toString());
  response = await http.get(urlServidor +  "agendamento/" + userInfo["id"].toString());
  return json.decode(response.body);
}


Future<void> deleteAgendamento(int id) async {
  http.Response response;
  response = await http.delete(urlServidor +  "agendamento/" + id.toString());
  print("agendamento de id:" +id.toString() + " foi apagado com sucesso!");
}

Future<void> agendarServico(int idServico, DateTime dataAgendamento) async {
  http.Response response;
  String day = "";
  String mes = "";
  String hora = "";
  String minuto = "";
  if(dataAgendamento.day < 10)
      day = "0";
  if(dataAgendamento.month < 10)
    mes = "0";
  if(dataAgendamento.hour < 10)
    hora = "0";
  if(dataAgendamento.minute < 10)
    minuto = "0";

  day += dataAgendamento.day.toString();
  mes += dataAgendamento.month.toString();
  hora += dataAgendamento.hour.toString();
  minuto += dataAgendamento.minute.toString();

  String Agendamento = dataAgendamento.year.toString() + "-" + mes + "-" + day + "T" + hora + ":" + minuto + ":00";
  Map body = {"idServico": idServico.toString(), "dataAgendamento": Agendamento.toString(), "idCliente":  userInfo["id"].toString()};
  response = await http.post(urlServidor +  "agendamento", body: json.encode(body), headers: {
    "Content-Type": "application/json"
  }, encoding: Encoding.getByName("utf-8") );

}