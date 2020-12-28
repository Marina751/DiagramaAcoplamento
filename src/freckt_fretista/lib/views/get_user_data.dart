import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freckt_fretista/models/fretista.model.dart';
import 'package:freckt_fretista/views/home_fretista.dart';

class GetUserData extends StatelessWidget {
  GetUserData(this.path);

  final String path;
  final model = FretistaModel();
  final fretistas = FirebaseFirestore.instance.collection('fretistas');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fretistas.doc(path).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Algo deu errado :('),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();

          model.loadDataFromFirestore(data: data);

          return HomeFretista();
          //Navigator.pushAndRemoveUntil(
          //  context,
          //  MaterialPageRoute(
          //    builder: (context) => HomeFretista(),
          //  ),
          //  (route) => false,
          //);
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
