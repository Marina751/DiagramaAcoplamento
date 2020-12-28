import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freckt_fretista/models/fretista.model.dart';
import 'package:freckt_fretista/utils/enums/response_status.dart';
import 'package:freckt_fretista/views/entrar.dart';

class HomeFretista extends StatefulWidget {
  @override
  _HomeFretistaState createState() => _HomeFretistaState();
}

class _HomeFretistaState extends State<HomeFretista> {
  final model = FretistaModel();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void signOut() async {
    final response = await model.signOutFretista();

    if (response.status == ResponseStatus.SUCCESS) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Entrar(),
        ),
        (route) => false,
      );
    } else {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(response.message),
        ),
      );
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
            backgroundImage: NetworkImage('https://picsum.photos/100'),
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
