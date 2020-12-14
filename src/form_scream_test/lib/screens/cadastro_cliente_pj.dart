import 'package:flutter/widgets.dart';
import 'package:form_scream_test/templates/form_field_template.dart';
import 'package:form_scream_test/templates/form_template.dart';
import 'package:form_scream_test/templates/scaffold_template.dart';

class CadastroClienteJuridico extends StatelessWidget {
  static const String _title = 'Pessoa Jurídica';
  static const String _buttonText = 'Cadastrar';

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      title: _title,
      buttonText: _buttonText,
      body: FormTemplate(
        children: [
          FormFieldTemplate(
            title: 'Nome da Empresa',
            hintText: 'josé empreendimentos',
          ),
          FormFieldTemplate(
            title: 'CNPJ',
            hintText: '12.345.678/0001-90',
          ),
          FormFieldTemplate(
            title: 'E-mail',
            hintText: 'jose_e@email.com',
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
