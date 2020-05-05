import 'package:barbeiroapp/pages/agenda_page.dart';
import 'package:barbeiroapp/pages/profissionais_page.dart';
import 'package:barbeiroapp/pages/servicos_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

/*
  'https://static1.segredosdesalao.com.br/articles/8/18/35/8/@/240462-quer-deixar-a-barba-crescer-confira-as-article_media_item-5.jpg',
  'https://www.ocarafashion.com/wp-content/uploads/2016/01/Imagem-destacada-Blog5-1200x800_c.jpg',
  'https://revistacabelos.uol.com.br/wp-content/uploads/2017/12/barba-perfeita-cabelosecia-5.jpg',
  'https://barbearia.org/wp-content/uploads/2015/12/desenho-da-barba.jpg',
  'https://fortissima.com.br/wp-content/uploads/2015/04/barba-perfeita1-tt-width-640-height-420-bgcolor-FFFFFF.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShGWN3MXfvWrCLd4zmSJn5ypRSnldB0e06BWK2pIoejX3wqAQL&s'
 */

final List<String> imgList = [
  'images/galeria/galeria.jpg',
  'images/galeria/galeria2.jpg',
  'images/galeria/galeria3.jpg',
  'images/galeria/galeria4.jpg',
  'images/galeria/galeria5.jpg',
  'images/galeria/galeria6.jpg'
];
//White = 0xFFFFFFFF | Black = 0xFF000000 |
int corIconServicos = 0xFF000000;

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<HomePage> {
  int _current = 0;
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      //Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          /*
                          child: Text(
                            //'No. ${imgList.indexOf(item)} image',
                            "Geleria de Fotos",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                            */
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // fotos
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                  width: 360.0,
                  height: 240.0,
                  decoration: new BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Column(
                    children: <Widget>[
                      new SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 200,
                        width: 320,
                        decoration: new BoxDecoration(
                            color: Color(0xFF3A3939),
                            borderRadius: BorderRadius.circular(20)),
                        child: CarouselSlider(
                          items: imageSliders,
                          options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: true,
                              aspectRatio: 2.0,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.map((url) {
                          int index = imgList.indexOf(url);
                          return Container(
                            width: 12.0, //8.0
                            height: 10.0, //8.0
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Color(0xFFB5B0B0) //B5B0B0
                                  : Color(0xFF6D6D6D),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ))
            ],
          ),
          // promoções
          new Row(
            children: <Widget>[
              new Container(
                width: 360,
                height: 110,
                decoration: BoxDecoration(
                    color: Colors.black,
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 120,
                      height: 100,
                      decoration: BoxDecoration(color: Color(0xFF3A3939)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "Promoções",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 1.0,
                          ),
                          Image(
                              image: AssetImage('images/icons/message.png'),
                              color: Colors.white,
                              fit: BoxFit.cover)
                        ],
                      ),
                    ),
                    new Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(color: Color(0xFF3A3939)),
                        child: Center(
                          child: Text(
                            "BARBA + BIGODE COM 50% de DESCONTO",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          // servicos
          SizedBox(
            height: 5.0,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                  width: 360.0,
                  height: 250.0,
                  decoration: new BoxDecoration(
                    color: Color(0xFF3A3939),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      new Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10.0,
                          ),
                          new Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ServicosPage()));
                              },
                              child: Container(
                                height: 110.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFF6D6D6D),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                      ),
                                      child: Image(
                                        image: AssetImage('images/icons/bag.png'),
                                          fit: BoxFit.fill,
                                          color: Color(corIconServicos),
                                      ),
                                    ),
                                    new Center(
                                      child: Text(
                                        "Serviços",
                                        style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          new Expanded(
                            child: GestureDetector(onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfissionaisPage()));
                            },
                              child:
                            Container(
                              height: 110.0,
                              decoration: BoxDecoration(
                                  color: Color(0xFF6D6D6D),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(10),
                                      // color: Colors.purpleAccent,
                                    ),
                                    child: Image(
                                      image: AssetImage('images/icons/contact.png'),
                                      fit: BoxFit.fill,
                                      color: Color(corIconServicos),
                                    ),
                                  ),
                                  new Center(
                                    child: Text(
                                      "Profissionais",
                                      style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),)
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          new Expanded(
                            child: GestureDetector(onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AgendaPage()));
                            },
                              child:
                            Container(
                              height: 110.0,
                              decoration: BoxDecoration(
                                  color: Color(0xFF6D6D6D),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(10),
                                      // color: Colors.purpleAccent,
                                    ),
                                    child: Image(
                                      image: AssetImage('images/icons/calendar.png'),
                                      fit: BoxFit.fill,
                                      color: Color(corIconServicos),
                                    ),
                                  ),
                                  new Center(
                                    child: Text(
                                      "Agenda",
                                      style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),)
                          ),
                          SizedBox(
                            width: 10.0,
                          ),

                        ],
                      ),

                      SizedBox(
                        height: 10.0,
                      ),

                      new Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10.0,
                          ),
                          new Expanded(
                            child: Container(
                              height: 110.0,
                              decoration: BoxDecoration(
                                  color: Color(0xFF6D6D6D),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(10),
                                      // color: Colors.purpleAccent,
                                    ),
                                    child: Image(
                                      image: AssetImage('images/icons/local.png'),
                                      fit: BoxFit.fill,
                                      color: Color(corIconServicos),
                                    ),
                                  ),
                                  new Center(
                                    child: Text(
                                      "Localização",
                                      style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          new Expanded(
                            child: Container(
                              height: 110.0,
                              decoration: BoxDecoration(
                                  color: Color(0xFF6D6D6D),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(10),
                                      // color: Colors.purpleAccent,
                                    ),
                                    child: Image(
                                      image: AssetImage('images/icons/whatsapp2.png'),
                                      fit: BoxFit.fill,
                                      color: Color(corIconServicos),
                                    ),
                                  ),
                                  new Center(
                                    child: Text(
                                      "Whatsapp",
                                      style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          new Expanded(
                            child: Container(
                              height: 110.0,
                              decoration: BoxDecoration(
                                  color: Color(0xFF6D6D6D),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(10),
                                      // color: Colors.purpleAccent,
                                    ),
                                    child: Image(
                                      image: AssetImage('images/icons/fone.png'),
                                      fit: BoxFit.fill,
                                      color: Color(corIconServicos),
                                    ),
                                  ),
                                  new Center(
                                    child: Text(
                                      "Telefone",
                                      style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),

                        ],
                      ),

                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}




/*
GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ServicosPage()));
                              },
                              child: Container(
                                height: 110.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFF6D6D6D),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                      ),
                                      child: Image(
                                        image: AssetImage('images/icons/bag.png'),
                                          fit: BoxFit.fill,
                                          color: Color(corIconServicos),
                                      ),
                                    ),
                                    new Center(
                                      child: Text(
                                        "Serviços",
                                        style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
 */