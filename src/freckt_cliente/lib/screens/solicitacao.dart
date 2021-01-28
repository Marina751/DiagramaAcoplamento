import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class solicitacao extends StatefulWidget {
  @override
  _solicitacaoState createState() => _solicitacaoState();
}

class _solicitacaoState extends State<solicitacao> {
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
          centerTitle: true,
          title: Text(
            'Configurações',
            style: GoogleFonts.roboto(
                color: Colors.white),
          ),
        ),
      
    );
  }
}