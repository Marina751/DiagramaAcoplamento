import 'package:flutter/material.dart';
import 'package:freckt_cliente/views/autorizacao_legal.dart';
import 'package:freckt_cliente/views/entrar.dart';
import 'package:freckt_cliente/views/verif_numero.dart';
import 'package:freckt_cliente/views/verif_aprovada.dart';
import 'package:freckt_cliente/views/verif_negada.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'Title',
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
