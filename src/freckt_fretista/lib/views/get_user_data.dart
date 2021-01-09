import 'package:freckt_fretista/models/fretista.model.dart';
import 'package:freckt_fretista/views/home_fretista.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freckt_fretista/views/loading.dart';

class GetUserData extends StatelessWidget {
  GetUserData(this.path);

  /// O [path] deverá ser o [uid] do usuário autenticado e será o nome
  /// do documento deste usuário no [FirebaseFirestore].
  final String path;

  /// O [model] e uma [Reference] para a coleção [fretistas] no
  /// [FirebaseFirestore].
  final model = FretistaModel();
  final fretistas = FirebaseFirestore.instance.collection('fretistas');

  /// O [build] metodo retorna um [FutureBuilder] que buscará os dados
  /// do usuário autenticado e carregará no model. Enquanto isso é feito,
  /// será exibido um [CircularProgressIndicator]
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fretistas.doc(path).get(), // future(), //
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
        }

        return Loading();
      },
    );
  }
}
