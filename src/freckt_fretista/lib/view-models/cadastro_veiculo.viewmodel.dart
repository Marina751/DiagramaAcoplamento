import 'package:mobx/mobx.dart';
part 'cadastro_veiculo.viewmodel.g.dart';

class CadastroVeiculoViewModel = _CadastroVeiculoViewModelBase
    with _$CadastroVeiculoViewModel;

abstract class _CadastroVeiculoViewModelBase with Store {
  @observable
  bool clickedButton = false;
  @action
  pressButton() => clickedButton = true;

  @observable
  String placa = '';
  @action
  changePlaca(String value) => placa = value;

  @observable
  String renavam = '';
  @action
  changeRenavam(String value) => renavam = value;

  @observable
  String uf = '';
  @action
  changeUf(String value) => uf = value;

  @observable
  String ano = '';
  @action
  changeAno(String value) => ano = value;

  @observable
  String marca = '';
  @action
  changeMarca(String value) => marca = value;

  @observable
  String cor = '';
  @action
  changeCor(String value) => cor = value;

  @observable
  String tipo = '';
  @action
  changeTipo(String value) => tipo = value;

  @observable
  String capacidade = '';
  @action
  changeCapacidade(String value) => capacidade = value;
}
