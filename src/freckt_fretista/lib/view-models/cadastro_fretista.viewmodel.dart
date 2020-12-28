import 'package:mobx/mobx.dart';
part 'cadastro_fretista.viewmodel.g.dart';

class CadastroFretistaViewModel = _CadastroFretistaViewModelBase
    with _$CadastroFretistaViewModel;

abstract class _CadastroFretistaViewModelBase with Store {
  @observable
  bool clickedButton = false;
  @action
  pressButton() => clickedButton = true;

  @observable
  String name = '';
  @action
  changeName(String value) => name = value;

  @observable
  String cpf = '';
  @action
  changeCPF(String value) => cpf = value;

  @observable
  String cnh = '';
  @action
  changeCNH(String value) => cnh = value;

  @observable
  String email = '';
  @action
  changeEmail(String value) => email = value;

  @observable
  String phone = '';
  @action
  changePhone(String value) => phone = value;

  @observable
  String password = '';
  @action
  changePassword(String value) => password = value;
}
