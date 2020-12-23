import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:email_validator/email_validator.dart';
import 'package:freckt_fretista/stores/cadastro_fretista.store.dart';

class CadastroFretistaController {
  final store = CadastroFretistaStore();

  String validateName() {
    if (store.name.isEmpty && store.clickedButton) {
      return 'É necessário informar seu nome';
    }
    return null;
  }

  String validateCPF() {
    if (store.clickedButton) {
      if (store.cpf.isEmpty) {
        return 'É necessário informar seu cpf';
      } else if (!CPF.isValid(store.cpf)) {
        return 'CPF inválido';
      }
    }

    return null;
  }

  String validateCNH() {
    return null;
  }

  String validateEmail() {
    if (store.clickedButton) {
      if (store.email.isEmpty) {
        return 'É necessário informar seu e-mail';
      } else if (!EmailValidator.validate(store.email)) {
        return 'E-mail inválido';
      }
    }

    return null;
  }

  String validatePhone() {
    return null;
  }

  String validatePassword() {
    if (store.clickedButton) {
      if (store.password.isEmpty) {
        return 'É necessário criar uma senha';
      } else if (store.password.length < 6) {
        return 'Deve ter no mínimo 6 caracteres';
      }
    }

    return null;
  }

  // Pensar em um jeito melhor depois
  //
  bool validate() {
    return (validateName() == null &&
        validateCPF() == null &&
        validateCNH() == null &&
        validateEmail() == null &&
        validatePhone() == null &&
        validatePassword() == null);
  }
}
