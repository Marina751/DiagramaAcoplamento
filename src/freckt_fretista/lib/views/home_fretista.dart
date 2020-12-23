import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freckt_fretista/controllers/fretista.controller.dart';

class HomeFretista extends StatelessWidget {
  final User user = FirebaseAuth.instance.currentUser;
  final controller = FretistaController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olá Breno'),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/100'),
          ), //user.photoURL)),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              controller.signOutFretista();
            },
          ),
        ],
      ),
    );
  }
}
