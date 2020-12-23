import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freckt_fretista/controllers/cadastro_fretista.controller.dart';
import 'package:freckt_fretista/templates/elevated_button_template.dart';
//import 'package:freckt_fretista/controllers/fretista.controller.dart';
import 'package:freckt_fretista/templates/form_field_template.dart';
import 'package:freckt_fretista/templates/scaffold_template.dart';
//import 'package:freckt_fretista/templates/button_template.dart';
import 'package:freckt_fretista/views/cadastro_veiculo.dart';
//import 'package:freckt_fretista/views/cadastro_veiculo.dart';

class CadastroFretista extends StatefulWidget {
  @override
  _CadastroFretistaState createState() => _CadastroFretistaState();
}

class _CadastroFretistaState extends State<CadastroFretista> {
  final String _title = 'Cadastrar Fretista';
  final String _buttonText = 'Próximo';
  final _formKey = GlobalKey<FormState>();
  final controller = CadastroFretistaController();

  void register() {
    //print('${controller.store.name.split(' ')[0]}');
    controller.store.pressButton();
    if (controller.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CadastroVeiculo(controller.store),
        ),
      );
      print('tudo certo!');
    }

    print('chegou aqui!');
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      title: _title,
      button: ElevatedButtonTemplate(
        onPressed: register,
        buttonText: _buttonText,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Observer(
                builder: (_) => FormFieldTemplate(
                  title: 'Nome',
                  hintText: 'José',
                  keyboardType: TextInputType.name,
                  errorText: controller.validateName(),
                  //validator: controller.validateName,
                  onChanged: controller.store.changeName,
                ),
              ),
              Observer(
                builder: (_) => FormFieldTemplate(
                  title: 'CPF',
                  hintText: '123.456.789.00',
                  keyboardType: TextInputType.number,
                  errorText: controller.validateCPF(),
                  //validator: controller.validateCPF,
                  onChanged: controller.store.changeCPF,
                ),
              ),
              //Observer(
              //  builder: (_) =>
              FormFieldTemplate(
                title: 'CNH',
                hintText: '123456789',
                keyboardType: TextInputType.number,
                //errorText: controller.validateCNH(),
                onChanged: controller.store.changeCNH,
              ),
              //),
              Observer(
                builder: (_) => FormFieldTemplate(
                  title: 'E-mail',
                  hintText: 'jose@email.com',
                  keyboardType: TextInputType.emailAddress,
                  errorText: controller.validateEmail(),
                  onChanged: controller.store.changeEmail,
                  //validator: controller.validateEmail,
                ),
              ),
              //Observer(
              //  builder: (_) =>
              FormFieldTemplate(
                title: 'Telefone',
                hintText: '(85) 98888-8888',
                keyboardType: TextInputType.phone,
                //errorText: controller.validatePhone(),
                onChanged: controller.store.changePhone,
              ),
              //),
              Observer(
                builder: (_) => FormFieldTemplate(
                  title: 'Senha',
                  hintText: '••••••',
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  errorText: controller.validatePassword(),
                  onChanged: controller.store.changePassword,
                  //validator: controller.validatePassword,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
