import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freckt_fretista/screens/cadastro_veiculo_inicio.dart';
import 'package:freckt_fretista/templates/form_field_template.dart';
import 'package:freckt_fretista/templates/form_template.dart';
import 'package:freckt_fretista/templates/scaffold_template.dart';
import 'package:freckt_fretista/templates/elevated_button_template.dart';

class CadastroFretistaJuridico extends StatelessWidget {
  static const String _title = 'Fretista Jurídico';
  static const String _buttonText = 'Próximo';

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      title: _title,
      button: ElevatedButtonTemplate(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CadastroVeiculoInicio(),
            ),
          );
        },
        buttonText: _buttonText,
      ),
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
            title: 'CNH',
            hintText: '123456789',
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
