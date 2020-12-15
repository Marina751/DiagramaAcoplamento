import 'package:flutter/material.dart';
import 'package:form_scream_test/screens/autorizacao_legal.dart';
import 'package:form_scream_test/screens/cadastro_inicio.dart';
import 'package:form_scream_test/screens/cadastro_veiculo_fim.dart';
import 'package:form_scream_test/screens/cadastro_veiculo_inicio.dart';
import 'package:form_scream_test/screens/entrar.dart';
import 'package:form_scream_test/screens/verif_numero.dart';
import 'package:form_scream_test/verif_aprovada.dart';
import 'package:form_scream_test/verif_negada.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'Title',
      routes: {
        '/': (context) => Root(),
        '/cdi': (context) => CadastroInicio(),
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
              child: Text('CDI'),
              onPressed: () {
                Navigator.pushNamed(context, '/cdi');
              },
            ),
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
