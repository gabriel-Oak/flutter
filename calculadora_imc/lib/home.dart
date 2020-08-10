import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _infoText = 'Informe seus dados';

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    _formKey.currentState.reset();
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _infoText = 'Informe seus dados';
    });
  }

  void _calculate() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weight / (height * height);

    setState(() {
      if (imc < 18.6) {
        _infoText =
            'Abaixo do Peso (${imc.toStringAsPrecision(3)}), vai comer!';
      } else if (imc < 24.9) {
        _infoText = 'Peso ideal (${imc.toStringAsPrecision(3)}), top!';
      } else if (imc < 29.9) {
        _infoText = 'Tem pochete (${imc.toStringAsPrecision(3)})';
      } else if (imc < 34.9) {
        _infoText =
            'Obesidade I (${imc.toStringAsPrecision(3)}), para de comer!';
      } else if (imc < 39.9) {
        _infoText =
            'Obesidade II (${imc.toStringAsPrecision(3)}), ai minha artéria!';
      } else {
        _infoText =
            'Obesidade III (${imc.toStringAsPrecision(3)}), você não vai ler isso por que deve ter comido o celular.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 180,
                color: Colors.green,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  labelText: 'Peso (kg)',
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
                controller: weightController,
                validator: (value) => value.isEmpty ? 'Insira o peso!' : null,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
                controller: heightController,
                validator: (value) => value.isEmpty ? 'Insira a altura!' : null,
              ),
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 16),
                height: 50,
                child: RaisedButton(
                  color: Colors.green,
                  child: Text(
                    'Calcular',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _calculate();
                    }
                  },
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
