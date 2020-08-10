import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Map> getData() async {
  const request = 'https://api.hgbrasil.com/finance?key=bd914d50';
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double dolar;
  double euro;

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  void _realChanged(String text) {
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(3);
    euroController.text = (real / euro).toStringAsFixed(3);
  }

  void _dolarChanged(String text) {
    double curDolar = double.parse(text);
    double real = dolar * curDolar;
    realController.text = real.toStringAsFixed(3);
    euroController.text = (real / euro).toStringAsFixed(3);
  }

  void _euroChanged(String text) {
    double curEuro = double.parse(text);
    double real = euro * curEuro;
    realController.text = real.toStringAsFixed(3);
    dolarController.text = (real / dolar).toStringAsFixed(3);
  }

  void _resetAll() {
    dolarController.text = (1 / dolar).toStringAsFixed(3);
    euroController.text = (1 / euro).toStringAsFixed(2);
    realController.text = '1.000';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetAll,
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  'Aguardando dados...',
                  style: TextStyle(color: Colors.amber, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Erro ao carregar dados :(',
                    style: TextStyle(color: Colors.amber, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                dolar = snapshot.data['results']['currencies']['USD']['buy'];
                euro = snapshot.data['results']['currencies']['EUR']['buy'];
                dolarController.text = (1 / dolar).toStringAsFixed(3);
                euroController.text = (1 / euro).toStringAsFixed(2);
                realController.text = '1.000';

                return SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(
                        Icons.monetization_on,
                        size: 150,
                        color: Colors.amber,
                      ),
                      buildTextField(
                        'Reais',
                        'R\$ ',
                        realController,
                        _realChanged,
                      ),
                      Divider(),
                      buildTextField(
                        'Dolares',
                        'US\$ ',
                        dolarController,
                        _dolarChanged,
                      ),
                      Divider(),
                      buildTextField(
                        'Euros',
                        '€ ',
                        euroController,
                        _euroChanged,
                      ),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

Widget buildTextField(
  String label,
  String prefix,
  TextEditingController controller,
  Function onChange,
) =>
    TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: 25),
        prefixText: prefix,
      ),
      style: TextStyle(color: Colors.amber, fontSize: 25),
      controller: controller,
      onChanged: onChange,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    );
