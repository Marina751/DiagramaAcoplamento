import 'package:flutter/material.dart';
import 'package:form_scream_test/screens/cadastro_inicio.dart';
import 'package:form_scream_test/screens/cadastro_veiculo_fim.dart';
import 'package:form_scream_test/screens/cadastro_veiculo_inicio.dart';
import 'package:form_scream_test/screens/verif_numero.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'Title',
      routes: {
        '/': (context) => Root(),
        '/cvi': (context) => CadastroVeiculoInicio(),
        '/cvf': (context) => CadastroVeiculoFim(),
        '/tst': (context) => VerifNumero(),
        '/cdi': (context) => CadastroInicio(),
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
              child: Text('CVI'),
              onPressed: () {
                Navigator.pushNamed(context, '/cvi');
              },
            ),
            ElevatedButton(
              child: Text('CVF'),
              onPressed: () {
                Navigator.pushNamed(context, '/cvf');
              },
            ),
            ElevatedButton(
              child: Text('TST'),
              onPressed: () {
                Navigator.pushNamed(context, '/tst');
              },
            ),
            ElevatedButton(
              child: Text('CDI'),
              onPressed: () {
                Navigator.pushNamed(context, '/cdi');
              },
            ),
          ],
        ),
      ),
    );
  }
}
