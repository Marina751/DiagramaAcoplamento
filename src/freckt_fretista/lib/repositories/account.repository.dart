import 'package:firebase_auth/firebase_auth.dart';

class AccountRepository {
  //FirebaseAuth auth = FirebaseAuth.instance;

  Future<User> register({String email = '', String password = ''}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
      //return FretistaModel(
      //  id: '1',
      //  name: model.name,
      //  cpf: model.cpf,
      //  email: model.email,
      //  phone: model.phone, //userCredential.user.phoneNumber, //
      //  password: model.password,
      //vehicles: model.vehicles,
      //);
      //} on FirebaseAuthException catch (e) {
      //  if (e.code == 'weak-password') {
      //    print('The password provided is too weak.');
      //  } else if (e.code == 'email-already-in-use') {
      //    print('The account already exists for that email.');
      //  }
      //  return null;
    } catch (e) {
      //print(e);
      return null;
    }
  }

  Future<String> login({String email = '', String password = ''}) async {
    try {
      //UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; //userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
      return 'há algo errado';
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void checkUserEmail() async {
    User user = FirebaseAuth.instance.currentUser;

    if (!user.emailVerified) {
      await user.sendEmailVerification();
    }
  }
}
