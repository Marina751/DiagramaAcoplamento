import 'package:flutter/widgets.dart';
import 'package:form_scream_test/templates/form_field_template.dart';
import 'package:form_scream_test/templates/form_template.dart';
import 'package:form_scream_test/templates/scaffold_template.dart';
import 'package:form_scream_test/templates/button_template.dart';

class CadastroVeiculoFim extends StatelessWidget {
  static const String _title = 'Cadastro Veículo';
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
            title: 'Altura',
            hintText: '2,20',
          ),
          FormFieldTemplate(
            title: 'Largura',
            hintText: '2,50',
          ),
          FormFieldTemplate(
            title: 'Comprimento',
            hintText: '4,50',
          ),
          FormFieldTemplate(
            title: 'Peso ??',
            hintText: '???',
          ),
          FormFieldTemplate(
            title: 'Capacidade',
            hintText: 'Pode mandar',
          ),
        ],
      ),
    );
  }
}
