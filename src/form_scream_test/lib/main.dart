import 'package:flutter/material.dart';
import 'package:form_scream_test/screens/cadastro_cliente_pf.dart';
import 'package:form_scream_test/screens/cadastro_cliente_pj.dart';
import 'package:form_scream_test/screens/cadastro_fretista_pf.dart';
import 'package:form_scream_test/screens/cadastro_fretista_pj.dart';
import 'package:form_scream_test/screens/cadastro_veiculo_fim.dart';
import 'package:form_scream_test/screens/cadastro_veiculo_inicio.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'Title',
      routes: {
        '/': (context) => Root(),
        '/ccf': (context) => CadastroClienteFisico(),
        '/ccj': (context) => CadastroClienteJuridico(),
        '/cff': (context) => CadastroFretistaFisico(),
        '/cfj': (context) => CadastroFretistaJuridico(),
        '/cvi': (context) => CadastroVeiculoInicio(),
        '/cvf': (context) => CadastroVeiculoFim(),
      },
      //home: Root(),
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
              child: Text('CCF'),
              onPressed: () {
                Navigator.pushNamed(context, '/ccf');
              },
            ),
            ElevatedButton(
              child: Text('CCJ'),
              onPressed: () {
                Navigator.pushNamed(context, '/ccj');
              },
            ),
            ElevatedButton(
              child: Text('CFF'),
              onPressed: () {
                Navigator.pushNamed(context, '/cff');
              },
            ),
            ElevatedButton(
              child: Text('CFJ'),
              onPressed: () {
                Navigator.pushNamed(context, '/cfj');
              },
            ),
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
          ],
        ),
      ),
    );
  }
}
