import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:freckt_cliente/models/cliente.model.dart';
import 'package:freckt_cliente/views/chats.dart';
import 'package:freckt_cliente/views/configuracoes.dart';
import 'package:freckt_cliente/views/agendamentos.dart';
import 'package:freckt_cliente/views/fale_conosco.dart';
import 'package:freckt_cliente/views/solicitacoes.dart';
import 'package:freckt_cliente/views/solicitar_frete.dart';

class HomeCliente extends StatefulWidget {
  @override
  _HomeClienteState createState() => _HomeClienteState();
}

/// Uma [home] não oficial apenas para testar o cadastro e o login
class _HomeClienteState extends State<HomeCliente> {
  final model = ClienteModel();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController textEditingController = TextEditingController();

  bool _isLoading = false;

  //GoogleMapController mapController;

  //final LatLng _center = const LatLng(-3.7443621, -38.5382412);

  //void _onMapCreated(GoogleMapController controller) {
  //  mapController = controller;
  //}

  void showSnackBar(String info) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(info),
      ),
    );
  }

  Drawer drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF20B8A6),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Fretes(),
                ),
              );
            },
            leading: Icon(Icons.local_shipping_rounded),
            title: Text('Fretes'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Olá ${model.name.split(' ')[0]}',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(model.photoUrl),
              backgroundColor: Colors.black12,
            ),
            //child: Image.network(
            //  model.photoUrl,
            //  loadingBuilder: (BuildContext context, Widget child,
            //      ImageChunkEvent loadingProgress) {
            //    if (loadingProgress == null) return child;
            //    return Center(
            //      child: CircularProgressIndicator(
            //        valueColor: AlwaysStoppedAnimation<Color>(Colors.black)//,
            //      ),
            //    );
            //  },
            //),
            //),
          ),
          //IconButton(
          //  icon: Icon(Icons.logout),
          //  onPressed: signOut,
          //),
        ],
        //bottom: PreferredSize(
        //  preferredSize: Size(double.infinity, 4.0),
        //  child: _isLoading
        //      ? LinearProgressIndicator(
        //          backgroundColor: Colors.white,
        //          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        //        )
        //      : Container(),
        //),
      ),
      drawer: drawer(),
      body: Container(
        color: Colors.black12,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SolicitarFrete(),
                    ),
                  );
                },
                child: Text('Solicitar frete'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chats(),
                    ),
                  );
                },
                child: Text('Conversas'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
