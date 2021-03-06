import 'package:flutter/material.dart';

import 'pages/settings.dart';
import 'pages/home.dart';
import 'pages/about.dart';

import 'widgets/HomeList.dart';

class Layout {

  static final pages = [
    HomePage.tag,
    AboutPage.tag,
    SettingsPage.tag
  ];

  static int currItem = 0;

  static Scaffold getContent(BuildContext context, content) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Layout.primary(),
        title: Center(
          child: Text('MarketList'),
        ),
        actions: Layout.getActions(context),
      ),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currItem,
        fixedColor: primary(),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home') 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            title: Text('Sobre')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Configurações')
          )
        ],
        onTap: (int index) {
          currItem = index;
          Navigator.of(context).pushNamed(pages[currItem]);
        },
      ),
    );
  }

  static List<Widget> getActions(BuildContext context) {
    List<Widget> items = List<Widget>();

    if ( currItem != 0) {
      return items;
    }

    items.add(
      GestureDetector(
        onTap: () {

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext ctx) {

              final _inputListaControler = TextEditingController();

              return AlertDialog(
                title: Text( 'Nova Lista'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      TextFormField(
                        autofocus: true,
                        controller: _inputListaControler,
                        decoration: InputDecoration(
                          hintText: 'Nome da sua lista'
                        )
                      )
                    ],
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    }
                  ),
                  FlatButton(
                    color: Layout.primary(),
                    child: Text('Adicionar', style: TextStyle(color: Layout.light()),),
                    onPressed: () {

                      HomeList.items.add(
                        ListTile(
                          leading: Icon(Icons.pages),
                          title: Text(_inputListaControler.text),
                          trailing: Icon(Icons.more_vert),
                        )
                      );

                      Navigator.of(ctx).pushReplacementNamed(HomePage.tag);
                    }
                  )
                ]
              );
            }
          );

        },
        child: Icon(Icons.add)
      ),
    );
    items.add(Padding(padding: EdgeInsets.only(right: 20)));
    return items;
  }

  static Color primary([double opacity = 1]) => Color.fromRGBO(62, 63, 89, opacity);
  static Color secondary([double opacity = 1]) => Color.fromRGBO(111, 168, 191, opacity);
  static Color light([double opacity = 1]) => Color.fromRGBO(242, 234, 228, opacity);
  static Color dark([double opacity = 1]) => Color.fromRGBO(51, 51, 51, opacity);

  static Color danger([double opacity = 1]) => Color.fromRGBO(217, 74, 74, opacity);
  static Color success([double opacity = 1]) => Color.fromRGBO(6, 166, 59, opacity);
  static Color info([double opacity = 1]) => Color.fromRGBO(0, 122, 166, opacity);
  static Color warning([double opacity = 1]) => Color.fromRGBO(166, 134, 0, opacity);

}
