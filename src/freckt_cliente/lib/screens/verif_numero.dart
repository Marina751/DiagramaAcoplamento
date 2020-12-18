import 'package:flutter/widgets.dart';
import 'package:freckt_cliente/templates/button_template.dart';
import 'package:flutter/material.dart';

class VerifNumero extends StatelessWidget {
  static const String _title = 'Verificação';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          _title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonTemplate(
        onPressed: () {},
        buttonText: 'Verificar',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                text:
                    'O Freckt enviará um SMS para verificar seu número de telefone. ',
                children: [
                  TextSpan(
                    text: 'Número errado?',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: EdgeInsets.all(80.0),
              child: Column(
                children: [
                  TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text('Digite o código de 6 dígitos'),
                  )
                ],
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: ListTile(
                leading: Icon(Icons.message_outlined),
                title: Text('Reenviar SMS'),
              ),
            ),
            Divider(),
            FlatButton(
              onPressed: () {},
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text('Me ligue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
