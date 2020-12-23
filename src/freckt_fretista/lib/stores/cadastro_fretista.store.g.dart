// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_fretista.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroFretistaStore on _CadastroFretistaStoreBase, Store {
  final _$clickedButtonAtom =
      Atom(name: '_CadastroFretistaStoreBase.clickedButton');

  @override
  bool get clickedButton {
    _$clickedButtonAtom.reportRead();
    return super.clickedButton;
  }

  @override
  set clickedButton(bool value) {
    _$clickedButtonAtom.reportWrite(value, super.clickedButton, () {
      super.clickedButton = value;
    });
  }

  final _$nameAtom = Atom(name: '_CadastroFretistaStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$cpfAtom = Atom(name: '_CadastroFretistaStoreBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$cnhAtom = Atom(name: '_CadastroFretistaStoreBase.cnh');

  @override
  String get cnh {
    _$cnhAtom.reportRead();
    return super.cnh;
  }

  @override
  set cnh(String value) {
    _$cnhAtom.reportWrite(value, super.cnh, () {
      super.cnh = value;
    });
  }

  final _$emailAtom = Atom(name: '_CadastroFretistaStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$phoneAtom = Atom(name: '_CadastroFretistaStoreBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$passwordAtom = Atom(name: '_CadastroFretistaStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$_CadastroFretistaStoreBaseActionController =
      ActionController(name: '_CadastroFretistaStoreBase');

  @override
  dynamic pressButton() {
    final _$actionInfo = _$_CadastroFretistaStoreBaseActionController
        .startAction(name: '_CadastroFretistaStoreBase.pressButton');
    try {
      return super.pressButton();
    } finally {
      _$_CadastroFretistaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$_CadastroFretistaStoreBaseActionController
        .startAction(name: '_CadastroFretistaStoreBase.changeName');
    try {
      return super.changeName(value);
    } finally {
      _$_CadastroFretistaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCPF(String value) {
    final _$actionInfo = _$_CadastroFretistaStoreBaseActionController
        .startAction(name: '_CadastroFretistaStoreBase.changeCPF');
    try {
      return super.changeCPF(value);
    } finally {
      _$_CadastroFretistaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCNH(String value) {
    final _$actionInfo = _$_CadastroFretistaStoreBaseActionController
        .startAction(name: '_CadastroFretistaStoreBase.changeCNH');
    try {
      return super.changeCNH(value);
    } finally {
      _$_CadastroFretistaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_CadastroFretistaStoreBaseActionController
        .startAction(name: '_CadastroFretistaStoreBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_CadastroFretistaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePhone(String value) {
    final _$actionInfo = _$_CadastroFretistaStoreBaseActionController
        .startAction(name: '_CadastroFretistaStoreBase.changePhone');
    try {
      return super.changePhone(value);
    } finally {
      _$_CadastroFretistaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_CadastroFretistaStoreBaseActionController
        .startAction(name: '_CadastroFretistaStoreBase.changePassword');
    try {
      return super.changePassword(value);
    } finally {
      _$_CadastroFretistaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clickedButton: ${clickedButton},
name: ${name},
cpf: ${cpf},
cnh: ${cnh},
email: ${email},
phone: ${phone},
password: ${password}
    ''';
  }
}
