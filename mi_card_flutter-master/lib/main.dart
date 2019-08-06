import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('images/avatar.jpg'),
                  ),
                  Text(
                    'Gabriel Carvalho',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'FLUTTER DEVELOPER',
                    style: TextStyle(
                      color: Colors.blue[100],
                      fontSize: 18,
                      fontFamily: 'Cantarell',
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 20,
                    child: Divider(color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: RaisedButton(
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(
                          Icons.call,
                          color: Colors.teal,
                        ),
                        title: Text(
                          '+55 16 99175-2205',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Cantarell',
                          ),
                        ),
                      ),
                      onPressed: () => _urlLauch('tel:+5516991752205'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: RaisedButton(
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'Send me an email',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Cantarell',
                          ),
                        ),
                      ),
                      onPressed: () => _urlLauch(
                          'mailto:gabriel.carvalho@smn.com.br?' +
                              'subject=Contato pelo app.&' +
                              'body=Olá, gostaria de entrar em contato com você.'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 90,
                        child: FloatingActionButton(
                          tooltip: 'My Instagram',
                          child:
                              Image(image: AssetImage('images/instaIco.png')),
                          onPressed: () => _urlLauch('https://flutter.io'),
                        ),
                      ),
                      Container(
                        height: 90,
                        child: FloatingActionButton(
                          tooltip: 'My WhatsApp',
                          child:
                              Image(image: AssetImage('images/whatsIco.png')),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        height: 90,
                        child: FloatingActionButton(
                          tooltip: 'My LinkedIn',
                          child: Image(image: AssetImage('images/linkIco.png')),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _urlLauch(String _url) async {
    if (await canLaunch(_url)) {
      launch(_url);
    } else {
      print('Não foi possivel realizar ação');
    }
  }
}
