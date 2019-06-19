import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
        title: Text(
          "Recupere Sua Senha",
          style: TextStyle(
            color: Colors.black38
          ),
        )
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.only(
              top: 40,
              left: 40,
              right: 40
            ),
            children: <Widget>[
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/reset-password-icon.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Esqueceu sua senha?",
                style:TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Por fabor, informe o email associado a sua conta, que enviaremos um link com as instruções para restauração de senha.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color(0xFFF58524),
                      Color(0xFFF92B7F)
                    ]
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5)
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Text(
                      'Enviar',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {},
                    ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}