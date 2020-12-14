import 'package:flutter/material.dart';
import 'package:form_scream_test/screens/cadastro_cliente_pf.dart';
import 'package:form_scream_test/screens/cadastro_veiculo_inicio.dart';
import 'package:form_scream_test/templates/form_field_template.dart';
import 'package:form_scream_test/templates/form_template.dart';
import 'package:form_scream_test/templates/scaffold_template.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Title',
      home: Root(),
    ),
  );
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Root')),
      body: Center(
        child: ElevatedButton(
          child: Text('Open template'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CadastroVeiculoInicio(),
              ),
            );
          },
        ),
      ),
    );
  }
}
