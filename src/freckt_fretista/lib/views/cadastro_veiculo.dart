import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freckt_fretista/controllers/cadastro_veiculo.controller.dart';
import 'package:freckt_fretista/templates/elevated_button_template.dart';
import 'package:freckt_fretista/templates/form_field_template.dart';
import 'package:freckt_fretista/templates/scaffold_template.dart';
import 'package:freckt_fretista/views/home_fretista.dart';

class CadastroVeiculo extends StatefulWidget {
  @override
  _CadastroVeiculoState createState() => _CadastroVeiculoState();
}

class _CadastroVeiculoState extends State<CadastroVeiculo> {
  final String _title = 'Veículo';

  final String _buttonText = 'Próximo';

  final _formKey = GlobalKey<FormState>();
  final _controller = CadastroVeiculoController();

  void buttonPressed() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      await _controller.save();

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomeFretista(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      title: _title,
      button: ElevatedButtonTemplate(
        onPressed: buttonPressed,
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
                        if (value.isEmpty) {
                          return 'Informe a placa';
                        }
                        return null;
                      },
                      onSaved: _controller.viewModel.changePlaca,
                      //(val) {
                      //  vehicle.placa = val;
                      //},
                    ),
                  ),
                  Expanded(
                    child: FormFieldTemplate(
                      title: 'UF',
                      hintText: 'CE',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Informe a UF';
                        }
                        return null;
                      },
                      onSaved: _controller.viewModel.changeUf,
                      //(val) {
                      //  vehicle.placa = val;
                      //},
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
                        if (value.isEmpty) {
                          return 'Informe o renavam';
                        }
                        return null;
                      },
                      onSaved: _controller.viewModel.changeRenavam,
                      //(val) {
                      //  vehicle.renavam = val;
                      //},
                    ),
                  ),
                  Expanded(
                    child: FormFieldTemplate(
                      title: 'Ano',
                      hintText: '2010',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Informe o ano';
                        }
                        return null;
                      },
                      onSaved: _controller.viewModel.changeAno,
                      //(val) {
                      //  vehicle.ano = val;
                      //},
                    ),
                  ),
                ],
              ),
              FormFieldTemplate(
                title: 'Marca/Modelo',
                hintText: 'Chevrolet/S10',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Informe a marca e o modelo';
                  }
                  return null;
                },
                onSaved: _controller.viewModel.changeMarca,
                //(val) {
                //  vehicle.marca = val;
                //},
              ),
              FormFieldTemplate(
                title: 'Cor',
                hintText: 'Preto',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Informe a cor';
                  }
                  return null;
                },
                onSaved: _controller.viewModel.changeCor,
                //(val) {
                //  vehicle.cor = val;
                //},
              ),
              FormFieldTemplate(
                title: 'Tipo',
                hintText: 'Caminhonte',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Informe o tipo';
                  }
                  return null;
                },
                onSaved: _controller.viewModel.changeTipo,
                //(val) {
                //  vehicle.tipo = val;
                //},
              ),
              FormFieldTemplate(
                title: 'Capacidade',
                hintText: '1500',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Informe a capacidade';
                  }
                  return null;
                },
                onSaved: _controller.viewModel.changeCapacidade,
                //(val) {
                //  vehicle.capacidade = val;
                //},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
