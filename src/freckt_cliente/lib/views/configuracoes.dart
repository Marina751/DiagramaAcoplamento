import 'package:flutter/material.dart';
import 'package:freckt_cliente/models/cliente.model.dart';
import 'package:freckt_cliente/utils/enums/response_status.dart';
import 'package:freckt_cliente/views/conta.dart';
import 'package:freckt_cliente/views/entrar.dart';

import '../models/cliente.model.dart';

class Configuracoes extends StatefulWidget {
  final model = ClienteModel();

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
                final response = await widget.model.signOutUser();

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
