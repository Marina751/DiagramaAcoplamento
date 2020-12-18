import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freckt_fretista/screens/cadastro_veiculo_fim.dart';
import 'package:freckt_fretista/templates/form_field_template.dart';
import 'package:freckt_fretista/templates/form_template.dart';
import 'package:freckt_fretista/templates/scaffold_template.dart';
import 'package:freckt_fretista/templates/button_template.dart';

class CadastroVeiculoInicio extends StatelessWidget {
  static const String _title = 'Cadastro Veículo';
  static const String _buttonText = 'Próximo';

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      title: _title,
      button: ButtonTemplate(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CadastroVeiculoFim(),
            ),
          );
        },
        buttonText: _buttonText,
      ),
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
