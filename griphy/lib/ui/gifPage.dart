import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class GifPage extends StatelessWidget {
  final Map<String, dynamic> _gifData;

  GifPage(this._gifData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _gifData['title'],
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(_gifData['images']['fixed_height']['url']);
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: FadeInImage.memoryNetwork(
          image: _gifData['images']['fixed_height']['url'],
          placeholder: kTransparentImage,
        ),
      ),
    );
  }
}
