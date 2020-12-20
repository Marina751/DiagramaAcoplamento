import 'package:flutter/material.dart';
import 'package:freckt_fretista/views/autorizacao_legal.dart';
import 'package:freckt_fretista/views/entrar.dart';
import 'package:freckt_fretista/views/verif_aprovada.dart';
import 'package:freckt_fretista/views/verif_negada.dart';
import 'package:freckt_fretista/views/verif_numero.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'Freckt Fretista',
      routes: {
        '/': (context) => Root(),
        '/vfnu': (context) => VerifNumero(),
        '/vfne': (context) => VerifNegada(),
        '/vfap': (context) => VerifAprovada(),
        '/aul': (context) => AutorizacaoLegal(),
        '/ent': (context) => Entrar(),
      },
    ),
  );
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Root')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('VRNU'),
              onPressed: () {
                Navigator.pushNamed(context, '/vfnu');
              },
            ),
            ElevatedButton(
              child: Text('VRNE'),
              onPressed: () {
                Navigator.pushNamed(context, '/vfne');
              },
            ),
            ElevatedButton(
              child: Text('VRAP'),
              onPressed: () {
                Navigator.pushNamed(context, '/vfap');
              },
            ),
            ElevatedButton(
              child: Text('AUL'),
              onPressed: () {
                Navigator.pushNamed(context, '/aul');
              },
            ),
            ElevatedButton(
              child: Text('ENT'),
              onPressed: () {
                Navigator.pushNamed(context, '/ent');
              },
            ),
          ],
        ),
      ),
    );
  }
}
