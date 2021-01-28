import 'package:flutter/material.dart';
import 'package:freckt_cliente/screens/autorizacao_legal.dart';
import 'package:freckt_cliente/screens/entrar.dart';
import 'package:freckt_cliente/screens/verif_numero.dart';
import 'package:freckt_cliente/screens/verif_aprovada.dart';
import 'package:freckt_cliente/screens/verif_negada.dart';
import 'package:freckt_cliente/screens/splash_screem.dart';
import 'package:freckt_cliente/screens/configuracoes.dart';
import 'package:freckt_cliente/screens/perfilfretista.dart';

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
        '/splsh': (context) => Splash(),
        '/config': (context) => Configuracoes(),
        '/perffre': (context) => perfil(),
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
        ElevatedButton(
          child: Text('SPLASH'),
          onPressed: () {
            Navigator.pushNamed(context, '/splsh');
          },
        ),
                ElevatedButton(
                  child: Text('CONFIG'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/config');
                  },
                ),
                ElevatedButton(
                  child: Text('PERFILFRE'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/perffre');
                  },
                ),
    ],
    ),
    ),
    );
    }
  }
