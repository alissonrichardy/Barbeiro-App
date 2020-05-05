

class Servico {
  int _id;
  String _nome;
  int _tempo;
  int _pontos;
  double _preco;

  Servico(int id, String nome, int tempo, int pontos, double preco) {
    this._id = id;
    this._nome = nome;
    this._tempo = tempo;
    this._pontos = pontos;
    this._preco = preco;
  }
  int getId(){
    return _id;
  }

  String getNome() {
    return _nome;
  }

  int getTempo() {
    return _tempo;
  }

  int getPontos() {
    return _pontos;
  }

  double getPreco() {
    return _preco;
  }
}