import 'package:flutter/widgets.dart';
import 'package:form_scream_test/templates/button_template.dart';
import 'package:form_scream_test/templates/scaffold_template.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  static const String _title = 'Autorização Legal';
  static const String _buttonText = 'Próximo';
  static const String _dec = 'Declaração de investigação de antecedentes';
  static const String _aut =
      'Autorizo a plataforma Freckt a reunir e processar meus dados pessoais, incluindo informações delicadas, com o objetivo de comprovar minha aptidão para utilizar a plataforma. Alego ainda a veracidade e autenticidade de todos os documentos submetidos a análise no cadastro realizado neste aplicativo.';

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      title: _title,
      buttonText: _buttonText,
      hasAlertTerms: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text(
              _dec,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              _aut,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          CheckboxListTile(
            value: true,
            onChanged: (value) {},
            title: Text('Eu estou ciente e concordo com os termos'),
          )
        ],
      ),
    );
  }
}

class RegisterTemplate extends StatelessWidget {
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
              onPressed: () {},
              buttonText: 'Cliente',
              color: Colors.white,
              fontColor: Colors.black,
            ),
            ButtonTemplate(onPressed: () {}, buttonText: 'Fretista'),
          ],
        ),
      ),
    );
  }
}
