import 'package:flutter/material.dart';
import 'package:form_scream_test/screens/cadastro_cliente_pf.dart';
import 'package:form_scream_test/screens/cadastro_cliente_pj.dart';
import 'package:form_scream_test/screens/cadastro_fretista_pf.dart';
import 'package:form_scream_test/screens/cadastro_fretista_pj.dart';
import 'package:form_scream_test/templates/button_template.dart';

class CadastroFim extends StatelessWidget {
  static const String _title = 'Cadastrar';
  final bool isCustomer;

  const CadastroFim({Key key, @required this.isCustomer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          _title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTemplate(
              onPressed: () {
                if (isCustomer) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CadastroClienteFisico()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CadastroFretistaFisico()),
                  );
                }
              },
              buttonText: 'Pessoa Fisica',
              color: Colors.white,
              fontColor: Colors.black,
            ),
            ButtonTemplate(
              onPressed: () {
                if (isCustomer) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CadastroClienteJuridico()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CadastroFretistaJuridico()),
                  );
                }
              },
              buttonText: 'Pessoa Jurídica',
            ),
          ],
        ),
      ),
    );
  }
}
