import 'package:barbeiroapp/pages/agenda_page.dart';
import 'package:barbeiroapp/pages/localizacao_page.dart';
import 'package:barbeiroapp/pages/profissionais_page.dart';
import 'package:barbeiroapp/pages/servicos_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';

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
int corIconServicos = 0xFFD2D2D2; //0xFF000000

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
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
    var _size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: new AppBar(
          title: Text("Home",
              style: TextStyle(
                fontFamily: 'editundo',
                color: Colors.white,
                fontSize: 35.0,
                // fontWeight: FontWeight.bold
              )),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Container(
          height: _size.height,
          width: _size.width,
          child: LayoutBuilder(builder: (_, constraints) {
            return Column(
              children: <Widget>[
                // fotos
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                        width: constraints.maxWidth * .9,
                        height: constraints.maxHeight * .37,
                        decoration: new BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Column(
                          children: <Widget>[
                            new SizedBox(
                              height: constraints.maxHeight * .01,
                            ),
                            Container(
                              width: constraints.maxWidth * .9,
                              height: constraints.maxHeight * .3,
                              decoration: new BoxDecoration(
                                color: Color(0xFF3A3939),
                                shape: BoxShape.rectangle,
                              ),
                              child: CarouselSlider(
                                items: imageSliders,
                                options: CarouselOptions(
                                    autoPlay: true,
                                    enlargeCenterPage: false,
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
                                  width: constraints.maxWidth * .04, //8.0
                                  height: constraints.maxHeight * .015, //8.0
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      width: constraints.maxWidth * .9,
                      height: constraints.maxHeight * .15,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: constraints.maxWidth * .35,
                            height: constraints.maxHeight * .15,
                            decoration: BoxDecoration(
                                color: Color(0xFF3A3939),
                                //borderRadius: BorderRadius.circular(30.0)
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "PROMOÇÕES",
                                  style: TextStyle(
                                      fontFamily: 'editundo',
                                      color: Colors.white,
                                      // fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18.0),
                                ),
                                Image(
                                    image: AssetImage(
                                        'images/icons-padrao/newspaper-regular.png'),
                                    color: Colors.white,
                                    height: 60,
                                    width: 70,
                                    fit: BoxFit.fill)
                              ],
                            ),
                          ),
                          // SizedBox(
                          //width: constraints.maxWidth * .01,
                          // ),
                          new Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF3A3939),
                                  //borderRadius: BorderRadius.circular(30.0)
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  "BARBA + BIGODE COM 50% DE DESCONTO",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'editundo',
                                      fontSize: 20.0,
                                      // fontWeight: FontWeight.bold,
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
                  height: constraints.maxHeight * .02,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                        width: constraints.maxWidth * .9,
                        height: constraints.maxHeight * .42,
                        decoration: new BoxDecoration(
                            color: Color(0xFF3A3939),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                SizedBox(
                                  width: constraints.maxWidth * .02,
                                ),
                                new Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ServicosPage()));
                                    },
                                    child: Container(
                                      height: 110.0,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF1A1818),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            height: 60,
                                            width: 80,
                                            decoration: BoxDecoration(),
                                            child: Image(
                                              image: AssetImage(
                                                  'images/icons-padrao/shopping-bag-solid.png'),
                                              //fit: BoxFit.fill,
                                              color: Color(corIconServicos),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          new Center(
                                            child: Text(
                                              "Serviços",
                                              style: TextStyle(
                                                fontFamily: 'editundo',
                                                fontSize: 15,
                                                color: Color(0xFFFFFFFF),
                                                // fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * .02,
                                ),
                                new Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfissionaisPage()));
                                  },
                                  child: Container(
                                    height: 110.0,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF1A1818),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 60,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              // borderRadius: BorderRadius.circular(10),
                                              // color: Colors.purpleAccent,
                                              ),
                                          child: Image(
                                            image: AssetImage(
                                                'images/icons-padrao/user-tie-solid.png'),
                                            //fit: BoxFit.fill,
                                            color: Color(corIconServicos),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        new Center(
                                          child: Text(
                                            "Profissionais",
                                            style: TextStyle(
                                              fontFamily: 'editundo',
                                              fontSize: 15,
                                              color: Color(0xFFFFFFFF),
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                                SizedBox(
                                  width: constraints.maxWidth * .02,
                                ),
                                new Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AgendaPage()));
                                  },
                                  child: Container(
                                    height: 110.0,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF1A1818),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 60,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              // borderRadius: BorderRadius.circular(10),
                                              // color: Colors.purpleAccent,
                                              ),
                                          child: Image(
                                            image: AssetImage(
                                                'images/icons-padrao/calendar-alt-regular.png'),
                                            //fit: BoxFit.fill,
                                            color: Color(corIconServicos),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        new Center(
                                          child: Text(
                                            "Agenda",
                                            style: TextStyle(
                                              fontFamily: 'editundo',
                                              fontSize: 15,
                                              color: Color(0xFFFFFFFF),
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                                SizedBox(
                                  width: constraints.maxWidth * .02,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: constraints.maxHeight * .015,
                            ),
                            new Row(
                              children: <Widget>[
                                SizedBox(
                                  width: constraints.maxWidth * .02,
                                ),
                                new Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LocalPage()));
                                  },
                                  child: Container(
                                    height: 110.0,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF1A1818),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 60,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              // borderRadius: BorderRadius.circular(10),
                                              // color: Colors.purpleAccent,
                                              ),
                                          child: Image(
                                            image: AssetImage(
                                                'images/icons-padrao/map-marker-alt-solid.png'),
                                            //fit: BoxFit.fill,
                                            color: Color(corIconServicos),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        new Center(
                                          child: Text(
                                            "Localização",
                                            style: TextStyle(
                                              fontFamily: 'editundo',
                                              fontSize: 15,
                                              color: Color(0xFFFFFFFF),
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                                SizedBox(
                                  width: constraints.maxWidth * .02,
                                ),
                                new Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => LocalPage()));
                                  },
                                  child: Container(
                                    height: 110.0,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF1A1818),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 60,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              // borderRadius: BorderRadius.circular(10),
                                              // color: Colors.purpleAccent,
                                              ),
                                          child: Image(
                                            image: AssetImage(
                                                'images/icons-padrao/whatsapp-brands.png'),
                                            //fit: BoxFit.fill,
                                            color: Color(
                                                corIconServicos), //Color(corIconServicos)
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        new Center(
                                          child: Text(
                                            "Whatsapp",
                                            style: TextStyle(
                                              fontFamily: 'editundo',
                                              fontSize: 15,
                                              color: Color(0xFFFFFFFF),
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                                SizedBox(
                                  width: constraints.maxWidth * .02,
                                ),
                                new Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => LocalPage()));
                                  },
                                  child: Container(
                                    height: 110.0,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF1A1818),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 60,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              // borderRadius: BorderRadius.circular(10),
                                              // color: Colors.purpleAccent,
                                              ),
                                          child: Image(
                                            image: AssetImage(
                                                'images/icons-padrao/phone-alt-solid.png'),
                                            // fit: BoxFit.fill,
                                            color: Color(corIconServicos),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        new Center(
                                          child: Text(
                                            "Telefone",
                                            style: TextStyle(
                                              fontFamily: 'editundo',
                                              fontSize: 15,
                                              color: Color(0xFFFFFFFF),
                                              // fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                                SizedBox(
                                  width: constraints.maxWidth * .02,
                                ),
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              ],
            );
          }),
        ));
  }
}
