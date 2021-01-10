import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freckt_cliente/views/entrar.dart';
import 'package:freckt_cliente/views/get_user_data.dart';
import 'package:freckt_cliente/views/loading.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'Freckt Cliente',
      routes: {
        '/': (context) => Root(),

        /// Aqui incluir as [rotas] do app
      },
    ),
  );
}

class Root extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          /// [user] será o usuário atual
          final user = FirebaseAuth.instance.currentUser;

          /// Se [user] for [null], significa que não temos um fretista
          /// autenticado no momento. Se este for o caso, chamamos a tela de
          /// [Entrar] para que um novo usuário faça login ou cadastre-se.
          /// Se ao invés disso tivermos um fretista, chamamos [GetUserData]
          /// para acessar o [FirebaseFirestore] e carregar o [model] com
          /// as informações dele.
          return (user != null ? GetUserData(user.uid) : Entrar());
        }

        /// [warning]: a tela de [Splash] não está pronta.
        // Otherwise, show something whilst waiting for initialization to complete.
        return Loading(); //Loading();
      },
    );
  }
}

/// [Root] retorna um [FutureBuilder]. Se durante este processo ocorrer um
/// erro, a tela [SomethingWentWrong] será exibida.
///
class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Algo deu errado!\nVerifique sua conexão com a internet.',
        textAlign: TextAlign.center,
      ),
    );
  }
}
