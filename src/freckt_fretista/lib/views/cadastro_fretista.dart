import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freckt_fretista/controllers/cadastro_fretista.controller.dart';
import 'package:freckt_fretista/utils/templates/elevated_button_template.dart';
import 'package:freckt_fretista/utils/templates/form_field_template.dart';
import 'package:freckt_fretista/utils/templates/scaffold_template.dart';
import 'package:freckt_fretista/utils/enums/response_status.dart';
import 'package:freckt_fretista/views/cadastro_veiculo.dart';

class CadastroFretista extends StatefulWidget {
  @override
  _CadastroFretistaState createState() => _CadastroFretistaState();
}

class _CadastroFretistaState extends State<CadastroFretista> {
  final String _title = 'Cadastrar Fretista';
  final String _buttonText = 'Próximo';
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = CadastroFretistaController();

  void register() async {
    _controller.viewModel.pressButton();

    if (_controller.validate()) {
      _controller.save();

      final response = await _controller.register();

      if (response.status == ResponseStatus.SUCCESS) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CadastroVeiculo(),
          ),
        );
      } else {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(response.message),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      key: _scaffoldKey,
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
                  errorText: _controller.validateName(),
                  //validator: _controller.validateName,
                  onChanged: _controller.viewModel.changeName,
                ),
              ),
              Observer(
                builder: (_) => FormFieldTemplate(
                  title: 'CPF',
                  hintText: '123.456.789.00',
                  keyboardType: TextInputType.number,
                  errorText: _controller.validateCPF(),
                  //validator: _controller.validateCPF,
                  onChanged: _controller.viewModel.changeCPF,
                ),
              ),
              //Observer(
              //  builder: (_) =>
              FormFieldTemplate(
                title: 'CNH',
                hintText: '123456789',
                keyboardType: TextInputType.number,
                //errorText: _controller.validateCNH(),
                onChanged: _controller.viewModel.changeCNH,
              ),
              //),
              Observer(
                builder: (_) => FormFieldTemplate(
                  title: 'E-mail',
                  hintText: 'jose@email.com',
                  keyboardType: TextInputType.emailAddress,
                  errorText: _controller.validateEmail(),
                  onChanged: _controller.viewModel.changeEmail,
                  //validator: _controller.validateEmail,
                ),
              ),
              //Observer(
              //  builder: (_) =>
              FormFieldTemplate(
                title: 'Telefone',
                hintText: '(85) 98888-8888',
                keyboardType: TextInputType.phone,
                //errorText: _controller.validatePhone(),
                onChanged: _controller.viewModel.changePhone,
              ),
              //),
              Observer(
                builder: (_) => FormFieldTemplate(
                  title: 'Senha',
                  hintText: '••••••',
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  errorText: _controller.validatePassword(),
                  onChanged: _controller.viewModel.changePassword,
                  //validator: _controller.validatePassword,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
