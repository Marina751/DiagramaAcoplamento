import 'package:flutter/material.dart';
import 'package:freckt_fretista/utils/templates/elevated_button_template.dart';

class Vamosla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pronto para rodar?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40.0,
                backgroundColor: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              "images/chave.png",
              fit: BoxFit.fitHeight,
              height: 200.0,
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButtonTemplate(
        onPressed: () {},
        buttonText: 'Vamos lá',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
