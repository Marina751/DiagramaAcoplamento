import 'package:flutter/material.dart';
import 'package:freckt_cliente/screens/cadastro_cliente_pf.dart';
import 'package:freckt_cliente/screens/cadastro_cliente_pj.dart';
import 'package:freckt_cliente/templates/button_template.dart';

class Cadastro extends StatelessWidget {
  static const String _title = 'Cadastrar';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CadastroClienteFisico()),
                );
              },
              buttonText: 'Pessoa Fisica',
              color: Colors.white,
              fontColor: Colors.black,
            ),
            ButtonTemplate(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CadastroClienteJuridico()),
                );
              },
              buttonText: 'Pessoa Jurídica',
            ),
          ],
        ),
      ),
    );
  }
}
