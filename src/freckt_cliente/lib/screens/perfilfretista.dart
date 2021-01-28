import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getflutter/components/rating/gf_rating.dart';

class perfil extends StatefulWidget {
  @override
  _perfilState createState() => _perfilState();
}

class _perfilState extends State<perfil> {
  
  double _top = 5;
  double _bom = 4;
  double _regular = 3;
  double _ruim = 2;
  double _pessimo = 1;
  static const Alignment topRight = Alignment(1.0,-1.0);


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
          'Seu Perfil',
          style: GoogleFonts.roboto(
              color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Icon(Icons.account_circle,
                  color: Colors.grey[300],
                  size: 98.0),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child: Text(
                  'José Sousa',
                  style: GoogleFonts.convergence(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:10.0),
              child: GFRating(
                size: 15.0,
                color: Color(0xff20B8A6),
                value: _bom,
                onChanged: (value) {
                  setState(() {
                    _bom = _bom;
                  });
                },
              ),
          ),
              Padding(
                padding: EdgeInsets.only(top:70.0,right:80.0),
                child: Text(
                  'Avaliações anteriores',
                  style: GoogleFonts.convergence(
                    fontSize: 18.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0,top:30.0),
                child: Row(
              
                  children: [
                    Icon(Icons.account_circle,
                        color: Colors.grey[300],
                        size: 50.0),
                Text(
                  'A carga estava correta!',
                  style: GoogleFonts.convergence(
                    fontSize: 15.0,
                    color: Colors.black,
                ),
                ),
                
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 140.0),
              child:GFRating(
                size: 10.0,
                color: Color(0xff20B8A6),
                
                value:_top,
                onChanged: (value) {
                  setState(() {
                    _top = _top;
                  });
                },
              ),
              ),
                
              
              Padding(
                padding: EdgeInsets.only(left: 15.0,top:10.0),
                child: Row(
                  
                  children: [
                    Icon(Icons.account_circle,
                        color: Colors.grey[300],
                        size: 50.0),
                    Text(
                      'Veio com atraso!',
                      style: GoogleFonts.convergence(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 140.0),
              child:GFRating(
                size: 10.0,
                color: Color(0xff20B8A6),
                value: _regular,
                onChanged: (value) {
                  setState(() {
                    _regular = _regular;
                  });
                },
              ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0,top:10.0),
                child: Row(
                  
                  children: [
                    Icon(Icons.account_circle,
                        color: Colors.grey[300],
                        size: 50.0),
                    Text(
                      'Cumpriu com o agendamento!',
                      
                      style: GoogleFonts.convergence(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 140.0),
              child:GFRating(
                size: 10.0,
                color: Color(0xff20B8A6),
                value: _top,
                onChanged: (value) {
                  setState(() {
                    _top = _top;
                  });
                },
              ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0,top:10.0),
                child: Row(
                  
                  children: [
                    Icon(Icons.account_circle,
                        color: Colors.grey[300],
                        size: 50.0),

                    Text(
                      'Ótimo frete!',
                      style: GoogleFonts.convergence(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 140.0),
              child:GFRating(
                size: 10.0,
                color: Color(0xff20B8A6),
                value: _top,
                onChanged: (value) {
                  setState(() {
                    _top = _top;
                  });
                },
              ),
              ),
            ],
          ),
        ),
      ),);
  }
}
