import 'package:flutter/material.dart';
import 'package:freckt_fretista/utils/templates/button_template.dart';
import 'package:freckt_fretista/views/home_fretista.dart';

class VerifAprovada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Image.asset(
                'images/aprovacao.png',
                height: 100.0,
              ),
            ),
            Text(
              'Verificação\nAprovada',
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
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeFretista()),
            (route) => false,
          );
        },
        buttonText: 'Continuar',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
