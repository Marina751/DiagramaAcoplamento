import 'package:flutter/material.dart';
import 'package:freckt_cliente/screens/cadastro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freckt_cliente/templates/button_template.dart';

class Entrar extends StatefulWidget {
  @override
  _EntrarState createState() => _EntrarState();
}

class _EntrarState extends State<Entrar> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Padding(
              padding: EdgeInsets.only(bottom: 5.0, top: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: 'E-mail',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextField(
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
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'Senha',
                ),
              ),
            ),
            ButtonTemplate(
              onPressed: () {},
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
                        builder: (context) => Cadastro(),
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
