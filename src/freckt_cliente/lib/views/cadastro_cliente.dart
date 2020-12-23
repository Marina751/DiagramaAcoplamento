import 'package:flutter/widgets.dart';
import 'package:freckt_cliente/templates/form_field_template.dart';
import 'package:freckt_cliente/templates/scaffold_template.dart';
import 'package:freckt_cliente/templates/button_template.dart';

class CadastroCliente extends StatelessWidget {
  static const String _title = 'Cadastro';
  static const String _buttonText = 'Cadastrar';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      title: _title,
      button: ButtonTemplate(
        onPressed: () {
          //if (_formKey.currentState.validate()) {
          //  _formKey.currentState.save();
          //}
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
                keyboardType: TextInputType.text,
                obscureText: true,
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
