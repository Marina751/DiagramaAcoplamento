import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freckt_fretista/templates/form_field_template.dart';
import 'package:freckt_fretista/templates/scaffold_template.dart';
import 'package:freckt_fretista/templates/button_template.dart';
import 'package:freckt_fretista/views/cadastro_veiculo.dart';

class CadastroFretista extends StatelessWidget {
  static const String _title = 'Fretista Físico';
  static const String _buttonText = 'Próximo';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      title: _title,
      button: ButtonTemplate(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CadastroVeiculo(),
            ),
          );
        },
        buttonText: _buttonText,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              FormFieldTemplate(
                title: 'Nome',
                hintText: 'José',
                keyboardType: TextInputType.name,
                validator: (value) {
                  return '';
                },
                onSaved: (val) {},
              ),
              FormFieldTemplate(
                title: 'CPF',
                hintText: '123.456.789.00',
                keyboardType: TextInputType.number,
                validator: (value) {
                  return '';
                },
                onSaved: (val) {},
              ),
              FormFieldTemplate(
                title: 'CNH',
                hintText: '123456789',
                keyboardType: TextInputType.number,
                validator: (value) {
                  return '';
                },
                onSaved: (val) {},
              ),
              FormFieldTemplate(
                title: 'E-mail',
                hintText: 'jose@email.com',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return '';
                },
                onSaved: (val) {},
              ),
              FormFieldTemplate(
                title: 'Telefone',
                hintText: '(85) 98888-8888',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  return '';
                },
                onSaved: (val) {},
              ),
              FormFieldTemplate(
                title: 'Senha',
                hintText: '••••••',
                obscureText: true,
                keyboardType: TextInputType.text,
                validator: (value) {
                  return '';
                },
                onSaved: (val) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
