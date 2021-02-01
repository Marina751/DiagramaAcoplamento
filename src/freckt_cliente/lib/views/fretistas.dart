import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freckt_cliente/utils/const.dart';
import 'package:freckt_cliente/utils/templates/avatar_template.dart';
import 'package:freckt_cliente/views/loading.dart';
import 'package:freckt_cliente/views/perfil_fretista.dart';
import 'package:freckt_cliente/views/something_went_wrong.dart';

class Fretistas extends StatefulWidget {
  @override
  _FretistasState createState() => _FretistasState();
}

class _FretistasState extends State<Fretistas> {
  Widget itemFretista(Map<String, dynamic> data) {
    return Container(
      child: FlatButton(
        child: Row(
          children: <Widget>[
            AvatarTemplate(url: data['photoUrl']),
            Flexible(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        data['name'],
                        style: TextStyle(color: primaryColor),
                      ),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                    ),
                    Container(
                      child: Text(
                        data['vehicles'][0]['marca'],
                        style: TextStyle(color: primaryColor),
                      ),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    )
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
              builder: (context) => PerfilFretista(data),
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

  Widget loadFretistas() {
    final fretistas = FirebaseFirestore.instance.collection('fretistas');

    return FutureBuilder(
      future: fretistas.where('completeRegistration', isEqualTo: true).get(),
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

                    return itemFretista(data);

                    /*return new ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(data['photoUrl']),
                      ),
                      title: new Text(data['name']),
                      subtitle: new Text(data['vehicles'][0]['marca']),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PerfilFretista(data),
                          ),
                        );
                      },
                    );*/
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
      appBar: AppBar(
        backgroundColor: Color(0xff20B8A6),
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Fretistas'),
      ),
      body: loadFretistas(),
    );
  }
}
