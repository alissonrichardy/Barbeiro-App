class Agendadamento {
  int _id;
  DateTime _dataAgendamento;
  String _nomeServico;
  String _nomeCliente;

  Agendadamento(int id, DateTime data, String servico, String cliente) {
    _id = id;
    _dataAgendamento = data;
    _nomeServico = servico;
    _nomeCliente = cliente;
  }

  String get nomeCliente => _nomeCliente;

  set nomeCliente(String value) {
    _nomeCliente = value;
  }

  String get nomeServico => _nomeServico;

  set nomeServico(String value) {
    _nomeServico = value;
  }

  DateTime get dataAgendamento => _dataAgendamento;

  set dataAgendamento(DateTime value) {
    _dataAgendamento = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
