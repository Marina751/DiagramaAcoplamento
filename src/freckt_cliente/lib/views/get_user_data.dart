import 'package:freckt_cliente/models/cliente.model.dart';
import 'package:freckt_cliente/views/completar_cadastro.dart';
import 'package:freckt_cliente/views/home_cliente.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freckt_cliente/views/loading.dart';
import 'package:freckt_cliente/views/something_went_wrong.dart';

import 'home_cliente.dart';
import 'home_cliente.dart';

class GetUserData extends StatelessWidget {
  GetUserData(this.path);

  /// O [path] deverá ser o [uid] do usuário autenticado e será o nome
  /// do documento deste usuário no [FirebaseFirestore].
  final String path;

  /// O [model] e uma [Reference] para a coleção [clientes] no
  /// [FirebaseFirestore].
  final model = ClienteModel();
  final clientes = FirebaseFirestore.instance.collection('clientes');

  /// O [build] metodo retorna um [FutureBuilder] que buscará os dados
  /// do usuário autenticado e carregará no model. Enquanto isso é feito,
  /// será exibido um [CircularProgressIndicator]
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: clientes.doc(path).get(), // future(), //
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return SomethingWentWrong(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data.data();

          if (data['photoUrl'] != null) {
            model.loadDataFromFirestore(data: data, uid: path);
            return HomeCliente();
          } else {
            model.loadRegistrationData(data: data, uid: path);
            return CompletarCadastro();
          }
        }

        return Loading();
      },
    );
  }
}
