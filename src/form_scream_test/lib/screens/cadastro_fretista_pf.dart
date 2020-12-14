import 'package:flutter/widgets.dart';
import 'package:form_scream_test/templates/form_field_template.dart';
import 'package:form_scream_test/templates/form_template.dart';
import 'package:form_scream_test/templates/scaffold_template.dart';

class CadastroFretistaFisico extends StatelessWidget {
  static const String _title = 'Fretista Físico';
  static const String _buttonText = 'Próximo';

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      title: _title,
      buttonText: _buttonText,
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
            title: 'CNH',
            hintText: '123456789',
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
