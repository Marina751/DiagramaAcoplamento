import 'package:flutter/widgets.dart';
import 'package:form_scream_test/templates/form_field_template.dart';
import 'package:form_scream_test/templates/form_template.dart';
import 'package:form_scream_test/templates/scaffold_template.dart';

class CadastroVeiculoInicio extends StatelessWidget {
  static const String _title = 'Cadastro Veículo';
  static const String _buttonText = 'Próximo';

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      title: _title,
      buttonText: _buttonText,
      body: FormTemplate(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: FormFieldTemplate(
                  title: 'Placa',
                  hintText: 'ABC-1234',
                ),
              ),
              Expanded(
                child: FormFieldTemplate(
                  title: 'UF',
                  hintText: 'CE',
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: FormFieldTemplate(
                  title: 'Código Renavam',
                  hintText: '1234567890',
                ),
              ),
              Expanded(
                child: FormFieldTemplate(
                  title: 'Ano',
                  hintText: '2010',
                ),
              ),
            ],
          ),
          FormFieldTemplate(
            title: 'Marca/Modelo',
            hintText: 'Chevrolet/S10',
          ),
          FormFieldTemplate(
            title: 'Cor',
            hintText: 'Preto',
          ),
          FormFieldTemplate(
            title: 'Tipo',
            hintText: 'Caminhonte',
          ),
        ],
      ),
    );
  }
}
