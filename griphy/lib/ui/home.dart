import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:griphy/ui/gifPage.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _search = '';
  int _offSet = 0;

  Future<Map> _getGifs() async {
    http.Response response;
    if (_search.isEmpty) {
      response = await http.get(
          'https://api.giphy.com/v1/gifs/trending?api_key=Iuk762a5ouAO6CTKRtuAywhrNMIcV41X&limit=20&rating=g');
    } else {
      response = await http.get(
          'https://api.giphy.com/v1/gifs/search?api_key=Iuk762a5ouAO6CTKRtuAywhrNMIcV41X&q=$_search&limit=19&offset=$_offSet&rating=g&lang=en');
    }
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    _getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Procurar GIFS',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
              onSubmitted: (text) {
                setState(() {
                  _search = text;
                  _offSet = 0;
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _getGifs(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Container(
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 5,
                      ),
                    );
                  default:
                    if (snapshot.hasError)
                      return Center(
                        child: Text(
                          'Erro ao buscar gifs',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      );
                    return _createTableContent(context, snapshot);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  int _getCount(int dataLength) {
    return _search.isEmpty ? dataLength : dataLength + 1;
  }

  Widget _createTableContent(BuildContext context, AsyncSnapshot snapshot) {
    final data = snapshot.data['data'];

    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: _getCount(data.length),
      itemBuilder: (contex, index) {
        if (_search.isEmpty || index < data.length)
          return GestureDetector(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: data[index]['images']['fixed_height']['url'],
              height: 300,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GifPage(data[index])),
              );
            },
            onLongPress: () {
              Share.share(data[index]['images']['fixed_height']['url']);
            },
          );

        return Container(
          child: GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 70,
                ),
                Text(
                  'Carregar mais...',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ],
            ),
            onTap: () {
              setState(() {
                _offSet += 19;
              });
            },
          ),
        );
      },
    );
  }
}
