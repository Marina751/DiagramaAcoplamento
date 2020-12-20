import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freckt_fretista/templates/form_field_template.dart';
import 'package:freckt_fretista/templates/scaffold_template.dart';
import 'package:freckt_fretista/templates/button_template.dart';

class CadastroVeiculo extends StatelessWidget {
  static const String _title = 'Veículo';
  static const String _buttonText = 'Próximo';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      title: _title,
      button: ButtonTemplate(
        onPressed: () {
          //Navigator.push(
          //  context,
          //  MaterialPageRoute(
          //    builder: (context) => CadastroVeiculoFim(),
          //  ),
          //);
        },
        buttonText: _buttonText,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: FormFieldTemplate(
                      title: 'Placa',
                      hintText: 'ABC-1234',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return '';
                      },
                      onSaved: (val) {},
                    ),
                  ),
                  Expanded(
                    child: FormFieldTemplate(
                      title: 'UF',
                      hintText: 'CE',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return '';
                      },
                      onSaved: (val) {},
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
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return '';
                      },
                      onSaved: (val) {},
                    ),
                  ),
                  Expanded(
                    child: FormFieldTemplate(
                      title: 'Ano',
                      hintText: '2010',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return '';
                      },
                      onSaved: (val) {},
                    ),
                  ),
                ],
              ),
              FormFieldTemplate(
                title: 'Marca/Modelo',
                hintText: 'Chevrolet/S10',
                keyboardType: TextInputType.text,
                validator: (value) {
                  return '';
                },
                onSaved: (val) {},
              ),
              FormFieldTemplate(
                title: 'Cor',
                hintText: 'Preto',
                keyboardType: TextInputType.text,
                validator: (value) {
                  return '';
                },
                onSaved: (val) {},
              ),
              FormFieldTemplate(
                title: 'Tipo',
                hintText: 'Caminhonte',
                keyboardType: TextInputType.text,
                validator: (value) {
                  return '';
                },
                onSaved: (val) {},
              ),
              FormFieldTemplate(
                title: 'Capacidade',
                hintText: '1T',
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
