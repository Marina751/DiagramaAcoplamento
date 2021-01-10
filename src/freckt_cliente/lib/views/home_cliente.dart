import 'package:freckt_cliente/utils/enums/response_status.dart';
import 'package:freckt_cliente/models/cliente.model.dart';
import 'package:freckt_cliente/views/entrar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeFretista extends StatefulWidget {
  @override
  _HomeFretistaState createState() => _HomeFretistaState();
}

/// Uma [home] não oficial apenas para testar o cadastro e o login
class _HomeFretistaState extends State<HomeFretista> {
  final model = ClienteModel();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void showSnackBar(String info) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(info),
      ),
    );
  }

  void signOut() async {
    final response = await model.signOutUser();

    if (response.status == ResponseStatus.SUCCESS) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Entrar(),
        ),
        (route) => false,
      );
    } else {
      showSnackBar(response.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Olá ${model.name.split(' ')[0]}'),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(model.photoUrl),
            // ?? 'https://picsum.photos/100'),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: signOut,
          ),
        ],
      ),
    );
  }
}
