import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:freckt_fretista/repositories/account.repository.dart';
import 'package:freckt_fretista/utils/enums/response_status.dart';
import 'package:freckt_fretista/utils/responses/default_response.dart';
import 'package:freckt_fretista/utils/vehicle.util.dart';
import 'package:freckt_fretista/view-models/cadastro_fretista.viewmodel.dart';

class FretistaModel {
  String id = '';
  String name = '';
  String cnh = '';
  String cpf = '';
  String email = '';
  String phone = '';
  String password = '';
  String photoUrl = '';
  String photoPath = '';
  final vehicles = <Vehicle>[];

  final _repository = AccountRepository();

  /// Para o model é usado um contrutor [factory] para que sempre
  /// que instanciado, seja o mesmo objeto model.
  static final FretistaModel _fretistaModel = FretistaModel._internal();

  factory FretistaModel() {
    return _fretistaModel;
  }

  FretistaModel._internal();

  String get getUserId => id;

  void setRegistrationData(CadastroFretistaViewModel viewModel) {
    name = viewModel.name;
    cnh = viewModel.cnh;
    cpf = viewModel.cpf;
    email = viewModel.email;
    phone = viewModel.phone;
    password = viewModel.password;
  }

  /// Recebe um [Vehicle] e adiciona este a lista
  void addVehicle(Vehicle vehicle) {
    vehicles.add(vehicle);
  }

  void setProfileData({String uPhotoPath, String uPhotoUrl}) {
    photoPath = uPhotoPath;
    photoUrl = uPhotoUrl;
  }

  // Este metodo salva aqui no model os dados do usuário quando ele está
  // se cadastrando.

  /// Solicita ao [repository] a criação de uma nova conta
  /// via email e senha.
  Future<DefaultResponse> createFretistaAccount({
    @required String uEmail,
    @required String uPassword,
  }) async {
    final response = await _repository.registerEmailPassword(
      email: uEmail,
      password: uPassword,
    );

    if (response.status == ResponseStatus.SUCCESS) {
      id = response.object.uid;
    }

    return response;
  }

  /// Solicita ao [repository] um login via email e senha.
  Future<DefaultResponse> loginFretistaAccount({
    @required String uEmail,
    @required String uPassword,
  }) async {
    final response = await _repository.doLoginEmailPassword(
      email: uEmail,
      password: uPassword,
    );

    return response;
  }

  // Siplesmente faz o logout do atual usuário autenticado.
  Future<DefaultResponse> signOutFretista() async {
    final response = await _repository.signOut();

    if (response.status == ResponseStatus.SUCCESS) {
      vehicles.clear();
    }

    return response;
  }

  /// Recebe os dados vindos do [FirebaseFirestore] e os coloca
  /// nos atributos adequadamente.
  void loadDataFromFirestore({@required Map<String, dynamic> data}) {
    final aux = data['vehicles'];

    print(aux.toString());

    name = data['name'];
    cnh = data['cnh'];
    cpf = data['cpf'];
    email = data['email'];
    phone = data['phone'];
    password = data['password'];
    photoPath = data['photoPath'];
    photoUrl = data['photoUrl'];

    aux.forEach((element) {
      vehicles.add(new Vehicle(
        placa: element['placa'],
        uf: element['uf'],
        renavam: element['renavam'],
        ano: element['ano'],
        marca: element['marca'],
        cor: element['cor'],
        tipo: element['tipo'],
        capacidade: element['capacidade'],
      ));
    });
  }

  /// Usado no ato de um cadastro. Salva dos dados no [FirebaseFirestore]
  Future<void> saveFretistaData() async {
    final aux = List<Map<String, dynamic>>();

    vehicles.forEach((vehicle) {
      aux.add(vehicle.toMap());
    });

    Map<String, dynamic> data = {
      'name': name,
      'cpf': cpf,
      'cnh': cnh,
      'email': email,
      'phone': phone,
      'password': password,
      'vehicles': aux,
      'photoPath': photoPath,
      'photoUrl': photoUrl
    };
    await FirebaseFirestore.instance.collection('fretistas').doc(id).set(data);
  }
}
