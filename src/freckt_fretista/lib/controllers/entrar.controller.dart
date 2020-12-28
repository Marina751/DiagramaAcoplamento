import 'package:freckt_fretista/models/fretista.model.dart';
import 'package:freckt_fretista/utils/responses/default_response.dart';
import 'package:freckt_fretista/view-models/entrar.viewmodel.dart';

class EntrarController {
  final viewModel = EntrarViewModel();
  final model = FretistaModel();

  Future<DefaultResponse> login() async {
    return await model.loginFretistaAccount(
      uEmail: viewModel.email,
      uPassword: viewModel.password,
    );
  }

  //String validateEmail() {
  //  if (viewModel.email.isEmpty) {
  //    return 'Informar seu e-mail';
  //  }
  //
  //  return null;
  //}

  //String validatePassword() {
  //  if (viewModel.password.isEmpty) {
  //    return 'Informe sua senha';
  //  }
  //
  //  return null;
  //}

  //bool validate() =>
  //    (viewModel.email.isNotEmpty && viewModel.password.isNotEmpty);
}
