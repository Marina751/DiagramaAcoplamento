import 'package:flutter/material.dart';
import 'package:freckt_fretista/models/fretista.model.dart';
import 'package:freckt_fretista/utils/consts.dart';
import 'package:freckt_fretista/utils/enums/response_status.dart';
import 'package:freckt_fretista/views/conta.dart';
import 'package:freckt_fretista/views/entrar.dart';
import 'package:freckt_fretista/views/privacidade.dart';
import 'package:freckt_fretista/views/seguranca.dart';
import 'package:freckt_fretista/views/sobre.dart';
import 'package:freckt_fretista/views/veiculos.dart';

class Configuracoes extends StatefulWidget {
  final model = FretistaModel();

  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  Text textWithColorTheme(String string) {
    return new Text(
      string,
      style: TextStyle(color: Consts.frecktThemeColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Consts.frecktThemeColor,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        //centerTitle: true,
        title: Text(
          'Configurações',
          //style: GoogleFonts.roboto(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        height: double.infinity,
        child: ListView(
          children: [
            ListTile(
              title: textWithColorTheme('Conta'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Conta(),
                  ),
                );
              },
            ),
            ListTile(
              title: textWithColorTheme('Veículos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Veiculos(),
                  ),
                );
              },
            ),
            ListTile(
              title: textWithColorTheme('Privacidade'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Privacidade(),
                  ),
                );
              },
            ),
            ListTile(
              title: textWithColorTheme('Segurança'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Seguranca(),
                  ),
                );
              },
            ),
            ListTile(
              title: textWithColorTheme('Sobre'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sobre(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Encerrar Seção',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () async {
                final response = await widget.model.signOutFretista();

                if (response.status == ResponseStatus.SUCCESS) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Entrar(),
                    ),
                    (route) => false,
                  );
                } else {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(response.message),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
