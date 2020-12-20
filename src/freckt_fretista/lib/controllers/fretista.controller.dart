import 'package:freckt_fretista/models/fretista.model.dart';
import 'package:freckt_fretista/repositories/account.repository.dart';
import 'package:freckt_fretista/view-models/cadastro_fretista.viewmodel.dart';

class FretistaController {
  AccountRepository repository;

  FretistaController() {
    repository = new AccountRepository();
  }

  Future<FretistaModel> create(CadastroFretistaViewModel model) async {
    var user = await repository.createFretistaAccount(model);

    return user;
  }
}
