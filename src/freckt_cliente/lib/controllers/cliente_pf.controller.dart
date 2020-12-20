import 'package:freckt_cliente/models/cliente_pj.model.dart';
import 'package:freckt_cliente/repositories/account_pj.repository.dart';
import 'package:freckt_cliente/view-models/cliente_pj.viewmodel.dart';

class ClientePJController {
  AccountPJRepository repository;

  ClientePJController() {
    repository = new AccountPJRepository();
  }

  Future<ClientePJModel> create(ClientePJViewModel model) async {
    var user = await repository.createClientePJAccount(model);

    return user;
  }
}
