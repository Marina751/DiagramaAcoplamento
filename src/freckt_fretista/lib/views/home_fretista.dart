import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freckt_fretista/utils/templates/avatar_template.dart';
import 'package:freckt_fretista/views/agendamentos.dart';
import 'package:freckt_fretista/models/fretista.model.dart';
import 'package:freckt_fretista/views/chat.dart';
import 'package:freckt_fretista/views/configuracoes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freckt_fretista/views/fale_conosco.dart';
import 'package:freckt_fretista/views/fretes.dart';
import 'package:freckt_fretista/utils/const.dart';
import 'package:freckt_fretista/views/loading.dart';
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

  Widget itemChat(Map<String, dynamic> data) {
    return Container(
      child: FlatButton(
        child: Row(
          children: <Widget>[
            AvatarTemplate(url: data['clientePhotoUrl']),
            Flexible(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        data['clienteName'],
                        style: TextStyle(color: primaryColor),
                      ),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                    ),
                    //Container(
                    //  child: Text(
                    //    data['vehicles'][0]['marca'],
                    //    style: TextStyle(color: primaryColor),
                    //  ),
                    //  alignment: Alignment.centerLeft,
                    //  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    //)
                  ],
                ),
                margin: EdgeInsets.only(left: 20.0),
              ),
            ),
          ],
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Chat(data: data),
            ),
          );
        },
        color: greyColor2,
        padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      margin: EdgeInsets.all(5.0),
    );
  }

  Widget loadChats() {
    final fretistas = FirebaseFirestore.instance.collection('messages');

    return FutureBuilder(
      future: fretistas.where('fretistaId', isEqualTo: model.getUserId).get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return SomethingWentWrong(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.hasData
              ? ListView(
                  padding: EdgeInsets.all(5.0),
                  children: snapshot.data.docs.map((doc) {
                    final data = doc.data();

                    return itemChat(data);
                  }).toList(),
                )
              : Center(
                  child: Text('Nada aqui.'),
                );
        }
        return Loading();
      },
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
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 4.0),
          child: _isLoading
              ? LinearProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                )
              : Container(),
        ),
      ),
      drawer: Drawer(
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
          ],
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          loadChats(),
          //GoogleMap(
          //  onMapCreated: _onMapCreated,
          //  initialCameraPosition: CameraPosition(
          //    target: _center,
          //    zoom: 11.0,
          //  ),
          //),
          Container(
            //color: Colors.blue,
            height: 200.0,
            child: DraggableScrollableSheet(
              initialChildSize: 0.2,
              minChildSize: 0.2,
              maxChildSize: 1.0,
              expand: false,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white, //Color(0xFF20B8A6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: ListView(
                    //).builder(
                    controller: scrollController,
                    children: [
                      Container(
                        height: 53.0,
                        //color: Colors.orange,
                        child: Center(
                          child: Icon(
                            Icons.maximize_rounded, //.expand_less_rounded,
                            //color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                    //itemCount: 25,
                    //itemBuilder: (BuildContext context, int index) {
                    //  return ListTile(title: Text('Item $index'));
                    //},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
