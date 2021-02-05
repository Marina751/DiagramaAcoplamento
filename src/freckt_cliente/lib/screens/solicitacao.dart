import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ElevatedButtonTemplate extends Container {
  ElevatedButtonTemplate({
    @required void Function() onPressed,
    @required String buttonText,
    Color color = Colors.black,
    Color fontColor = Colors.white,
  }) : super(
          margin: EdgeInsets.all(10.0),
          height: 50.0,
          width: 150.0,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: color,
              onPrimary: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
            ),
            child: Text(
              buttonText,
              style: TextStyle(color: fontColor),
            ),
          ),
        );
}

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
          
          title: Text(
            'Solicitação',
            style: GoogleFonts.roboto(
                color: Colors.white),
          ),
        ),
      body: Padding(
        padding: EdgeInsets.only(left:10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

        SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.0,top:30.0),
        child: Row(
                  children: [
                   Text(
                  'Maria Isabel',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.teal[600],
                ),
                ),
                 Padding(
                   
                   padding: EdgeInsets.only(left: 70.0),
                    child: Icon(
                      Icons.account_circle,
                        color: Colors.teal[600],
                        size: 35.0),
                 ),   
                 Padding(
                   padding: EdgeInsets.only(left: 15.0),
                    child: Icon(Icons.markunread_outlined,
                        color: Colors.teal[600],
                        size: 35.0),
                 ),
                ],
                ),
           ),
           Padding(
                   
                   padding: EdgeInsets.only(left: 20.0,top:50.0),
                    child: Text(
                        'Tipo de carga: Cimento',
                       style: TextStyle( fontSize: 18.0,
                        color: Colors.black,
                       ),  
                    ),
                 ),   
                 Padding(
                   
                   padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                        'Quantidade: 140 sacos',
                        style: TextStyle(
                    fontSize: 18.0,
                        color: Colors.black,
                        ),
                    ),
                 ),   
                 Padding(
                   
                   padding: EdgeInsets.only(left: 20.0,top:30.0),
                    child: Text(
                        'Partida: Av. Treze de Maio, 1000',
                        style: TextStyle(
                    fontSize: 18.0,
                        color: Colors.black,
                        ),
                    ),
                 ),
                  Padding(
                   
                   padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                        'Destino: R. Sebastião de Abreu, 1234',
                        style: TextStyle(
                    fontSize: 18.0,
                        color: Colors.black,
                        ),
                    ),
                 ),      
                  Padding(
                   
                   padding: EdgeInsets.only(left: 20.0,top:30.0),
                    child: Text(
                        'Altura: 1 m',
                       style: TextStyle(
                    fontSize: 18.0,
                        color: Colors.grey,
                        ),
                    ),
                 ),      
                 Padding(
                   
                   padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                        'Largura: 0,6 m',
                        style: TextStyle(
                    fontSize: 18.0,
                        color: Colors.grey,
                        ),
                    ),
                 ),      
                 Padding(
                   
                   padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                        'Comprimento: 0,7 m',
                    style: TextStyle(    
                    fontSize: 18.0,
                        color: Colors.grey,
                    ), 
                    ),
                 ),     
                 Padding(
                   
                   padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                        'Ocupação: 58,8 m²',
                        style: TextStyle(
                    fontSize: 18.0,
                        color: Colors.grey,
                        ),
                    ),
                 ),     
                  Padding(
                   
                   padding:  EdgeInsets.only(left:90.0, top:50.0),
                    
                    child: Text(
                      
                        'R\$ 150,00',
                        style: TextStyle(
                    fontSize: 35.0,
                        color: Colors.black,
                        ),
                    ),
                 ),     

                 SingleChildScrollView(
        padding: EdgeInsets.only(top:110.0),
        child: Row(
                  children: [ 
           ElevatedButtonTemplate(
             onPressed: () {},
             buttonText: ('Cancelar'),
             color: Colors.black,
             fontColor: Colors.white,
           ),
           ElevatedButtonTemplate(
             onPressed: () {
                
          
             },
             buttonText: ('Avançar'),
             color: Colors.black,
             fontColor: Colors.white, 

           ),
                  ],
        ),  
                 ),       
              ],
        ),
         
      ),
    );
  }
}