import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freckt_cliente/controllers/cadastro_cliente.controller.dart';
import 'package:freckt_cliente/utils/enums/response_status.dart';
import 'package:freckt_cliente/utils/templates/elevated_button_template.dart';
import 'package:freckt_cliente/utils/templates/form_field_template.dart';
import 'package:freckt_cliente/utils/templates/scaffold_template.dart';
import 'package:freckt_cliente/views/cadastro_perfil.dart';

class CadastroCliente extends StatefulWidget {
  @override
  _CadastroClienteState createState() => _CadastroClienteState();
}

class _CadastroClienteState extends State<CadastroCliente> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = CadastroClienteController();

  void register() async {
    // Muda o estado do botão para 'já pressionado'.Isso serve para o
    // MobX não apresentar qualquer erro na validação dos campos
    // do formulário, antes que o botão seja pressionado.
    _controller.viewModel.pressButton();

    // Se todos os campos foram preenchidos de forma válida, os dados
    // serão salvos e será criada uma conta com o email e a senha
    // informados e o usuário será direcionado para o cadastro de um
    // veículo.
    if (_controller.validate()) {
      _controller.save();

      final response = await _controller.register();

      if (response.status == ResponseStatus.SUCCESS) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CadastroPerfil(),
          ),
        );
      } else {
        /// Esta [SnackBar] não está ficando visível quando devia.
        /// o problema possivelmente é no [ScaffoldTenplate].
        /// Corrigir isso o mais breve!!
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
      title: 'Cadastro',
      button: ElevatedButtonTemplate(
        onPressed: register,
        buttonText: 'Cadastrar',
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
                  onChanged: _controller.viewModel.changeName,
                ),
              ),
              Observer(
                builder: (_) => FormFieldTemplate(
                  title: 'CPF',
                  hintText: '123.456.789.00',
                  keyboardType: TextInputType.number,
                  errorText: _controller.validateCPF(),
                  onChanged: _controller.viewModel.changeCPF,
                ),
              ),
              Observer(
                builder: (_) => FormFieldTemplate(
                  title: 'E-mail',
                  hintText: 'jose@email.com',
                  keyboardType: TextInputType.emailAddress,
                  errorText: _controller.validateEmail(),
                  onChanged: _controller.viewModel.changeEmail,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
