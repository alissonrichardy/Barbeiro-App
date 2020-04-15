import 'package:barbeiroapp/pages/login_page.dart';
import 'package:flutter/material.dart';

class Servico {
  String _nome;
  int _tempo;
  int _pontos;
  int _preco;

  Servico(String nome, int tempo, int pontos, int preco) {
    this._nome = nome;
    this._tempo = tempo;
    this._pontos = pontos;
    this._preco = preco;
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

  int getPreco() {
    return _preco;
  }
}

List<Servico> listServico = [
  new Servico("Lavagem + Corte", 10, 20, 20),
  new Servico("Corte de Cabelo", 10, 20, 20),
  new Servico("Barba Completa", 10, 20, 20)
];

class ServicosPage extends StatefulWidget {
  @override
  _ServicosPageState createState() => _ServicosPageState();
}

class _ServicosPageState extends State<ServicosPage> {
  Servico servico1 = new Servico("Lavagem + Corte", 10, 20, 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1E1E1E), //Color(0XFF1E1E1E),
      appBar: new AppBar(
        title: new Text("Serviços"),
        centerTitle: true,
      ),
      body: new ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: listServico.length,
        itemBuilder: CardServico,
      ),
    );
  }
}


Widget CardServico(BuildContext context, int index) {
  return Padding(
    padding: EdgeInsets.only(top: 20),
    child: Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.black,
        child: Align(
          alignment: Alignment(0.9, 0.0),
          child: Text("Agendar", style: TextStyle(color: Colors.white),),
        ),
      ),
      direction: DismissDirection.endToStart,

      onDismissed: (direction){
       // Navigator.push(context, MaterialPageRoute(builder: (context) => AgendamentoPage()));
       },

    child: new Container(
      height: 100.0,
      decoration: new BoxDecoration(
          color: Color(0xFF707070), borderRadius: BorderRadius.circular(10.0)),
      child: new Center(
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Container(
                width: 200.0,
                child: new Text(
                  listServico[index].getNome(),
                  style: new TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
              SizedBox(
                width: 30.0,
              ),
              new Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: new Container(
                      height: 90.0,
                      decoration: new BoxDecoration(
                        // borderRadius: new BorderRadius.circular(100.0),
                        //  color: Colors.black),
                      ),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            listServico[index].getTempo().toString() + " min",
                            style: new TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                            "R\$ " + listServico[index].getPreco().toStringAsPrecision(4),
                            style: new TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                            listServico[index].getPontos().toString() + " pts",
                            style: new TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          )),
    ),),
  );
}

/*
            new SizedBox(
              height: 20.0,
            ),
            new Container(
              height: 100.0,
              decoration: new BoxDecoration(
                  color: Color(0xFF707070),
                  borderRadius: BorderRadius.circular(10.0)),
              child: new Center(
                  child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    width: 200.0,
                    child: new Text(
                      "Corte + Lavagem",
                      style: new TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  new Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: new Container(
                      height: 90.0,
                      decoration: new BoxDecoration(
                         // borderRadius: new BorderRadius.circular(100.0),
                        //  color: Colors.black),
                      ),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "10 min",
                            style: new TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                            "R\$ 20,00",
                            style: new TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                            "20 pts",
                            style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )),

                ],
              )),
            ),

            new SizedBox(
              height: 20.0,
            ),
            new Container(
              height: 100.0,
              decoration: new BoxDecoration(
                  color: Color(0xFF707070),
                  borderRadius: BorderRadius.circular(10.0)),
              child: new Center(
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 200.0,
                        child: new Text(
                          "Corte + Lavagem",
                          style: new TextStyle(fontSize: 25.0, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      new Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: new Container(
                              height: 90.0,
                              decoration: new BoxDecoration(
                                // borderRadius: new BorderRadius.circular(100.0),
                                //  color: Colors.black),
                              ),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Text(
                                    "10 min",
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  new Text(
                                    "R\$ 20,00",
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold, fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  new Text(
                                    "20 pts",
                                    style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )),

                    ],
                  )),
            ),
*/
