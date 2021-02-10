import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freckt_fretista/utils/templates/avatar_template.dart';
import 'package:freckt_fretista/views/agendamentos.dart';
import 'package:freckt_fretista/models/fretista.model.dart';
import 'package:freckt_fretista/views/chat.dart';
import 'package:freckt_fretista/views/chats.dart';
import 'package:freckt_fretista/views/configuracoes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freckt_fretista/views/fale_conosco.dart';
import 'package:freckt_fretista/views/fretes.dart';
import 'package:freckt_fretista/utils/consts.dart';
import 'package:freckt_fretista/views/loading.dart';
import 'package:freckt_fretista/views/solicitacoes.dart';
import 'package:freckt_fretista/views/something_went_wrong.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:freckt_fretista/views/entrar.dart';
//import 'package:freckt_fretista/utils/enums/response_status.dart';

class HomeFretista extends StatefulWidget {
  @override
  _HomeFretistaState createState() => _HomeFretistaState();
}

/// Uma [home] não oficial apenas para testar o cadastro e o login
class _HomeFretistaState extends State<HomeFretista> {
  final model = FretistaModel();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController listScrollController = ScrollController();
  int _selectedIndex = 0;

  //GoogleMapController mapController;

  //final LatLng _center = const LatLng(-3.7443621, -38.5382412);

  //void _onMapCreated(GoogleMapController controller) {
  //  mapController = controller;
  //}

  //void showSnackBar(String info) {
  //  _scaffoldKey.currentState.showSnackBar(
  //    SnackBar(
  //      content: Text(info),
  //    ),
  //  );
  //}

  Drawer drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Consts.greenDark,
              image: DecorationImage(
                image: AssetImage('images/freckt_logo.png'),
              ),
            ),
            //child: Center(
            child: null, //Text(''),
            //),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Agendamentos(),
                ),
              );
            },
            leading: Icon(Icons.watch_later_rounded),
            title: Text('Agendamentos'),
          ),
          ListTile(
            onTap: () {
              //Navigator.push(
              //  context,
              //  MaterialPageRoute(
              //    builder: (context) => Fretes(),
              //  ),
              //);
            },
            leading: Icon(Icons.local_shipping_rounded),
            title: Text('Histórico de fretes'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FaleConosco(),
                ),
              );
            },
            leading: Icon(Icons.message_rounded),
            title: Text('Fale conosco'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Configuracoes(),
                ),
              );
            },
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.help),
            title: Text('Ajuda'),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    Solicitacoes(), //Text('Index 0: Home'),
    Text('Colocar agendamentos aqui'),
    Chats(), //Text('Index 2: School'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Olá, ${model.name.split(' ')[0]}',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(model.photoUrl),
              backgroundColor: Colors.black12,
            ),
          ),
        ],
      ),
      drawer: drawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping_rounded),
            label: 'Solicitações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_rounded),
            label: 'Agendamentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            label: 'Mensagens',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff13786C), //Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: Container(child: _widgetOptions.elementAt(_selectedIndex)),
    );
  }
}
