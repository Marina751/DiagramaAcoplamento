import 'package:flutter/material.dart';
import 'package:freckt_fretista/models/fretista.model.dart';
import 'package:freckt_fretista/utils/enums/response_status.dart';
import 'package:freckt_fretista/views/conta.dart';
import 'package:freckt_fretista/views/entrar.dart';
import 'package:freckt_fretista/views/veiculos.dart';

class Configuracoes extends StatefulWidget {
  final model = FretistaModel();

  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff20B8A6),
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
              title: Text('Conta'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Conta()));
              },
            ),
            ListTile(
              title: Text('Veículos'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Veiculos()));
              },
            ),
            ListTile(
              title: Text('Privacidade'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Segurança'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Sobre'),
              onTap: () {},
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
