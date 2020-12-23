import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freckt_fretista/controllers/fretista.controller.dart';
import 'package:freckt_fretista/models/fretista.model.dart';
import 'package:freckt_fretista/stores/cadastro_fretista.store.dart';
import 'package:freckt_fretista/templates/elevated_button_template.dart';
import 'package:freckt_fretista/templates/form_field_template.dart';
import 'package:freckt_fretista/templates/scaffold_template.dart';
import 'package:freckt_fretista/templates/button_template.dart';
//import 'package:freckt_fretista/views/cadastro_perfil.dart';
import 'package:freckt_fretista/views/home_fretista.dart';

class CadastroVeiculo extends StatefulWidget {
  CadastroVeiculo(this.store);

  final CadastroFretistaStore store;

  @override
  _CadastroVeiculoState createState() => _CadastroVeiculoState();
}

class _CadastroVeiculoState extends State<CadastroVeiculo> {
  final String _title = 'Veículo';

  final String _buttonText = 'Próximo';

  final _formKey = GlobalKey<FormState>();

  final vehicle = Vehicle();

  final controller = FretistaController();

  //final _scaffoldKey = GlobalKey<ScaffoldState>();

  void onPressed() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.store.vehicles.add(vehicle);

      //_scaffoldKey.currentState.showSnackBar(SnackBar(
      //  content: LinearProgressIndicator(),
      //));

      await controller.createFretistaAccount(
          widget.store.email, widget.store.password);

      controller.saveFretistaData(widget.store);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeFretista(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      //key: _scaffoldKey,
      title: _title,
      button: ElevatedButtonTemplate(
        onPressed: onPressed,
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
                          return 'Informe a capacidade';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        vehicle.placa = val;
                      },
                    ),
                  ),
                  Expanded(
                    child: FormFieldTemplate(
                      title: 'UF',
                      hintText: 'CE',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Informe a capacidade';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        vehicle.placa = val;
                      },
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
                      onSaved: (val) {
                        vehicle.renavam = val;
                      },
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
                      onSaved: (val) {
                        vehicle.ano = val;
                      },
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
                onSaved: (val) {
                  vehicle.marcaModelo = val;
                },
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
                onSaved: (val) {
                  vehicle.cor = val;
                },
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
                onSaved: (val) {
                  vehicle.tipo = val;
                },
              ),
              FormFieldTemplate(
                title: 'Capacidade',
                hintText: '1T',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Informe a capacidade';
                  }
                  return null;
                },
                onSaved: (val) {
                  vehicle.capacidade = val;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
