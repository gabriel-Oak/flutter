import 'package:flutter/material.dart';
import 'webView.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onPressed: () =>
                        _urlLauch('tel:+5516991752205', false, context),
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
                      'body=Olá, gostaria de entrar em contato com você.',
                      false,
                      context,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 90,
                      child: FloatingActionButton(
                        heroTag: "btn1",
                        tooltip: 'My Instagram',
                        child: Image(image: AssetImage('images/instaIco.png')),
                        onPressed: () => _urlLauch(
                          'https://instagram.com/gabriel_oakcoast/',
                          true,
                          context,
                        ),
                      ),
                    ),
                    Container(
                      height: 90,
                      child: FloatingActionButton(
                        heroTag: "btn2",
                        tooltip: 'My WhatsApp',
                        child: Image(image: AssetImage('images/whatsIco.png')),
                        onPressed: () => _urlLauch(
                          'whatsapp://send?phone=5516991752205&text=Ola%20eu%20gostaria%20de%20entrar%20em%20contato.',
                          false,
                          context,
                        ),
                      ),
                    ),
                    Container(
                      height: 90,
                      child: FloatingActionButton(
                        heroTag: "btn3",
                        tooltip: 'My LinkedIn',
                        child: Image(image: AssetImage('images/linkIco.png')),
                        onPressed: () => _urlLauch(
                            'https://www.linkedin.com/in/gabriel-carvalho-costa-15a71a143/',
                            true,
                            context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _urlLauch(String _url, bool _webView, BuildContext context) async {
    if (_webView) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebViewContainer(_url),
        ),
      );
    } else {
      await canLaunch(_url)
          ? launch(_url)
          : throw 'Não foi possivel realizar ação';
    }
  }
}
