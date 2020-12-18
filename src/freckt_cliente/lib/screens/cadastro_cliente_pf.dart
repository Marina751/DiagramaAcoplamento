import 'package:flutter/widgets.dart';
import 'package:freckt_cliente/templates/form_field_template.dart';
import 'package:freckt_cliente/templates/form_template.dart';
import 'package:freckt_cliente/templates/scaffold_template.dart';
import 'package:freckt_cliente/templates/button_template.dart';

class CadastroClienteFisico extends StatelessWidget {
  static const String _title = 'Pessoa Física';
  static const String _buttonText = 'Cadastrar';

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      title: _title,
      button: ButtonTemplate(
        onPressed: () {},
        buttonText: _buttonText,
      ),
      body: FormTemplate(
        children: [
          FormFieldTemplate(
            title: 'Nome',
            hintText: 'José',
          ),
          FormFieldTemplate(
            title: 'CPF',
            hintText: '123.456.789.00',
          ),
          FormFieldTemplate(
            title: 'E-mail',
            hintText: 'jose@email.com',
          ),
          FormFieldTemplate(
            title: 'Telefone',
            hintText: '(85) 98888-8888',
          ),
          FormFieldTemplate(
            title: 'Senha',
            hintText: '••••••',
          ),
        ],
      ),
    );
  }
}
