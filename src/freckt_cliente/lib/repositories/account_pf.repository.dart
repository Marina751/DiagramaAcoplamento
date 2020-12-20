import 'package:freckt_cliente/models/cliente_pf.model.dart';
import 'package:freckt_cliente/view-models/cliente_pf.viewmodel.dart';

class AccountPFRepository {
  Future<ClientePFModel> createClientePFAccount(
      ClientePFViewModel model) async {
    await Future.delayed(Duration(microseconds: 1500));

    return ClientePFModel(
      id: '1',
      name: model.name,
      cpf: model.cpf,
      email: model.email,
      phone: model.phone,
      password: model.password,
    );
  }
}
