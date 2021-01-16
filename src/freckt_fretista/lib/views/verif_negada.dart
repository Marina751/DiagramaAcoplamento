import 'package:flutter/material.dart';
import 'package:freckt_fretista/utils/templates/button_template.dart';

class VerifNegada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "images/negado.png",
              fit: BoxFit.fitHeight,
              height: 100.0,
            ),
            Text(
              'Verificação\nNegada',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40.0,
                backgroundColor: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: ButtonTemplate(
        onPressed: () {
          Navigator.pop(context);
        },
        buttonText: 'Voltar',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
