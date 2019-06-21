import 'package:flutter/material.dart';
import 'package:projeto2/pages/reset-password.dart';
import 'package:projeto2/pages/singup.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.only(
            top: 60,
            left: 40,
            right: 40
          ),
          children: <Widget>[
            SizedBox(
                width: 128,
                height: 128,
                child: Image.asset('assets/logo.png'),
              ),
            SizedBox(height: 10),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                )
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                )
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Recuperar Senha"
                ),
                onPressed: () {
                  new Future.delayed(
                    const Duration(milliseconds: 400),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetPasswordPage(), 
                      ),
                    )
                  );
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
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
                )
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Entrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                          ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          height: 28,
                          width: 28,
                          child: Image.asset('assets/bone.png'),
                        ),
                      )
                    ],
                  ),
                  onPressed: () => {},
                ),
              )
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFF3C5A99),
                borderRadius: BorderRadius.all(
                  Radius.circular(5)
                )
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Login facebook",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                          ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          height: 28,
                          width: 28,
                          child: Image.asset('assets/fb-icon.png'),
                        ),
                      )
                    ],
                  ),
                  onPressed: () => {},
                ),
              )
            ),
            SizedBox(height: 10),
            Container(
              height: 40,
              child: FlatButton(
                child: Text(
                  "Cadastro",
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  new Future.delayed(
                    const Duration(milliseconds: 400),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingUp(), 
                      ),
                    )
                  );
                },
              ),
            )
          ],
        ),
      )
    );
  }
}