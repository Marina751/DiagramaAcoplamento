class ClientePFModel {
  String id;
  String name;
  String cpf;
  String email;
  String phone;
  String password;

  ClientePFModel(
      {this.id, this.name, this.cpf, this.email, this.phone, this.password});

  ClientePFModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cpf = json['cpf'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cpf'] = this.cpf;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    return data;
  }
}
