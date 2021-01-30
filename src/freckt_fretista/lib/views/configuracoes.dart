import 'package:flutter/material.dart';
import 'package:freckt_fretista/views/conta.dart';
import 'package:freckt_fretista/views/veiculos.dart';

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
        body: Container(
          padding: EdgeInsets.all(10.0),
            height: double.infinity,
            child: ListView(
            children: [
              ListTile(
                title: Text('Conta'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Conta()));
                },
              ),
              ListTile(
                title: Text('Veículos'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Veiculos()));
                },
              ),
              ListTile(
                title: Text('Privacidade'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Segurança'),
                onTap: () {},
              ),ListTile(
                title: Text('Sobre'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Encerrar Seção',
                style: TextStyle(color: Colors.red),),
                onTap: () {},
              ),

            ],
          ),
          ),
        
        );
  }
}
/*Padding(
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
                      /*style: GoogleFonts.comfortaa(
                        color: Colors.black,
                        fontSize: 15,
                      ),*/
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
                      //style: GoogleFonts.comfortaa(
                      //  color: Colors.black,
                      //  fontSize: 15,
                      //),
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
                      //style: GoogleFonts.comfortaa(
                       // color: Colors.black,
                        //fontSize: 15,
                      //),
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
                      //style: GoogleFonts.comfortaa(
                      //  color: Colors.black,
                      //  fontSize: 15,
                      //),
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
                      //style: GoogleFonts.comfortaa(
                      //  color: Colors.black,
                      //  fontSize: 15,
                      //),
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
                      //style: GoogleFonts.comfortaa(
                      //  color: Colors.red,
                        //fontSize: 15,
                      //),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        )*/