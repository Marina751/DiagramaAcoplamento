import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Configuracoes extends StatefulWidget {
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
        body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 70,
                  alignment: Alignment.centerLeft,
                  child: FlatButton(
                    child: Text(
                      "Conta",
                      style: GoogleFonts.comfortaa(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  height: 80,
                  alignment: Alignment.centerLeft,
                  child: FlatButton(
                    child: Text(
                      "Meus Veículos",
                      style: GoogleFonts.comfortaa(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  height: 80,
                  alignment: Alignment.centerLeft,
                  child: FlatButton(
                    child: Text(
                      "Privacidade",
                      style: GoogleFonts.comfortaa(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  height: 80,
                  alignment: Alignment.centerLeft,
                  child: FlatButton(
                    child: Text(
                      "Segurança",
                      style: GoogleFonts.comfortaa(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  height: 80,
                  alignment: Alignment.centerLeft,
                  child: FlatButton(
                    child: Text(
                      "Sobre",
                      style: GoogleFonts.comfortaa(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  height: 100,
                  alignment: Alignment.centerLeft,
                  child: FlatButton(
                    child: Text(
                      "Encerrar Sessão",
                      style: GoogleFonts.comfortaa(
                        color: Colors.red,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
