class FretistaModel {
  String id;
  String name;
  String cpf;
  String email;
  String phone;
  String password;
  List<Vehicles> vehicles;

  FretistaModel({
    this.id,
    this.name,
    this.cpf,
    this.email,
    this.phone,
    this.password,
    this.vehicles,
  });

  FretistaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cpf = json['cpf'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    if (json['vehicles'] != null) {
      vehicles = new List<Vehicles>();
      json['vehicles'].forEach((v) {
        vehicles.add(new Vehicles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cpf'] = this.cpf;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    if (this.vehicles != null) {
      data['vehicles'] = this.vehicles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vehicles {
  String placa;
  String uf;
  String renavam;
  String ano;
  String marcaModelo;
  String cor;
  String tipo;
  String capacidade;

  Vehicles({
    this.placa,
    this.uf,
    this.renavam,
    this.ano,
    this.marcaModelo,
    this.cor,
    this.tipo,
    this.capacidade,
  });

  Vehicles.fromJson(Map<String, dynamic> json) {
    placa = json['placa'];
    uf = json['uf'];
    renavam = json['renavam'];
    ano = json['ano'];
    marcaModelo = json['marca_modelo'];
    cor = json['cor'];
    tipo = json['tipo'];
    capacidade = json['capacidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['placa'] = this.placa;
    data['uf'] = this.uf;
    data['renavam'] = this.renavam;
    data['ano'] = this.ano;
    data['marca_modelo'] = this.marcaModelo;
    data['cor'] = this.cor;
    data['tipo'] = this.tipo;
    data['capacidade'] = this.capacidade;
    return data;
  }
}
