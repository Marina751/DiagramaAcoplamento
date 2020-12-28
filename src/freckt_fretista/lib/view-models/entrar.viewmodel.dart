//import 'package:mobx/mobx.dart';
//part 'entrar.viewmodel.g.dart';

//class EntrarViewModel = _EntrarViewModelBase with _$EntrarViewModel;

//abstract class _EntrarViewModelBase with Store {
class EntrarViewModel {
  String email = '';
  String password = '';

  changeEmail(String value) {
    email = value;
    print('change!');
  }

  changePassword(String value) {
    password = value;
    print('change!');
  }
}
