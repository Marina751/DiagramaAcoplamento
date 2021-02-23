import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freckt_cliente/utils/consts.dart';
import 'package:freckt_cliente/utils/route_name.dart';
import 'package:freckt_cliente/utils/templates/elevated_button_template.dart';
import 'package:freckt_cliente/utils/templates/submenu_scaffold_template.dart';

class VerifyEmailScreen extends StatefulWidget {
  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      checkEmailVerified();
    });
    super.initState();
    // add listener in the future
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SubmenuScaffoldTemplate(
        title: "Verificação de Email",
        body: Column(children: [
          Expanded(
            child: Icon(
              Icons.outgoing_mail,
              color: Consts.greenDark,
              size: 80,
            ),
          ),
          Expanded(
              child: Column(children: [
            Text(
              "Um email foi enviado para\n",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${user.email}\n',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Text(
              "Clique no link do email recebido para validar sua conta e começar a utilizar o aplicativo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ])),
          Text('Não recebeu?', style: TextStyle(color: Colors.grey)),
          ElevatedButtonTemplate(onPressed: () {}, buttonText: 'REENVIAR EMAIL')
        ]));
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.HOME,
        (route) => false,
      );
    }
  }
}
