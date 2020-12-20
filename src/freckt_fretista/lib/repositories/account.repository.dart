import 'package:freckt_fretista/models/fretista.model.dart';
import 'package:freckt_fretista/view-models/cadastro_fretista.viewmodel.dart';

class AccountRepository {
  Future<FretistaModel> createFretistaAccount(
      CadastroFretistaViewModel model) async {
    await Future.delayed(Duration(microseconds: 1500));

    return FretistaModel(
      id: '1',
      name: model.name,
      cpf: model.cpf,
      email: model.email,
      phone: model.phone,
      password: model.password,
      vehicles: model.vehicles,
    );
  }
}
