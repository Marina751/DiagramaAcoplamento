import 'package:flutter/material.dart';
import 'package:freckt_fretista/controllers/entrar.controller.dart';
import 'package:freckt_fretista/utils/enums/response_status.dart';
import 'package:freckt_fretista/views/cadastro_fretista.dart';
import 'package:freckt_fretista/views/get_user_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freckt_fretista/utils/templates/button_template.dart';

class Entrar extends StatefulWidget {
  @override
  _EntrarState createState() => _EntrarState();
}

class _EntrarState extends State<Entrar> {
  bool _showPassword = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _controller = EntrarController();

  void login() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      final response = await _controller.login();

      if (response.status == ResponseStatus.SUCCESS) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GetUserData(response.object.uid),
          ),
        );
      } else {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(response.message),
          ),
        );
      }
    } else {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('entre ou cadastre-se'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 150.0, 20.0, 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_shipping_rounded, size: 34.0),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Freckt',
                    style: GoogleFonts.comfortaa(fontSize: 24.0),
                  ),
                )
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.0, top: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'E-mail',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'informe seu email';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _controller.viewModel.changeEmail(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: TextFormField(
                      obscureText: !_showPassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Senha',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'informe sua senha';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _controller.viewModel.changePassword(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            ButtonTemplate(
              onPressed: login,
              buttonText: 'Entrar',
            ),
            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('ou'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            InkWell(
              child: Text(
                'Esqueceu sua Senha?',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Ainda não tem uma conta? '),
                InkWell(
                  child: Text(
                    'Cadastre-se',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CadastroFretista(),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
