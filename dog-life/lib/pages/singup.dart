import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SingUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro')
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(
            top: 40,
            left: 40,
            right: 40
          ),
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              alignment:  Alignment(0, 1.15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/profile-picture.png'),
                  fit: BoxFit.fitHeight
                )
              ),
              child: Container(
                height: 56,
                width: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3,1],
                    colors: [
                      Color(0xFFF58524),
                      Color(0xFFF92B7F)
                    ]
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(56)
                  ),
                  border: Border.all(
                    width: 4,
                    color: Colors.white
                  ),
                ),
                child: FloatingActionButton(
                  onPressed: (){},
                  child: Icon(Icons.add),
                )    
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20
                )
              ),
              style: TextStyle(
                fontSize: 20
              ),
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
                )
              ),
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20
                )
              ),
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(
              height: 10,
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
                )
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
           /* Container(
              height: 40,
              alignment: Alignment.center,
              child: SizedBox.expand(
                child: FlatButton(
                  child: Text(
                    'Cancelar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  onPressed: () {
                    new Future.delayed(
                      const Duration(milliseconds: 400),
                      () => Navigator.pop(context, false)
                    );
                  },
                ),
              )
            )*/
          ],
        ),
      ),
    );
  }
}