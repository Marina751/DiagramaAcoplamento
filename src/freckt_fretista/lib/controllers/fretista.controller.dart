import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freckt_fretista/repositories/account.repository.dart';
import 'package:freckt_fretista/stores/cadastro_fretista.store.dart';

class FretistaController {
  AccountRepository _repository;

  FretistaController() {
    _repository = new AccountRepository();
  }

  Future<User> createFretistaAccount(String email, String password) async {
    User user = await _repository.register(email: email, password: password);

    return user;
  }

  Future<String> loginFretistaAccount(String email, String password) async {
    // User user =
    return await _repository.login(email: email, password: password);

    //return user;
  }

  void signOutFretista() async {
    await _repository.signOut();
  }

  void saveFretistaData(CadastroFretistaStore model) {
    Map<String, dynamic> data = {
      'nome': model.name,
      'cpf': model.cpf,
      'email': model.email,
      'vehicles': [
        {
          'placa': model.vehicles.first.placa,
          'ano': model.vehicles.first.ano,
          'marca': model.vehicles.first.marcaModelo,
          'cor': model.vehicles.first.cor
        }
      ]
    };
    FirebaseFirestore.instance
        .collection('fretistas')
        .doc('${model.cpf}-${model.name.split(' ')[0]}')
        .set(data);
  }
}
