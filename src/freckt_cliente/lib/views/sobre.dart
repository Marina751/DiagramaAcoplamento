import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff20B8A6),
          leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Sobre'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              ListTile(
                title: Text('Termos de Uso'),
                onTap: () {
                  showAlertDialog4(context);
                },
              ),
              ListTile(
                title: Text('Política de Dados'),
                onTap: () {
                  showAlertDialog3(context);
                },
              ),
            ],
          ),
        ));
  }
}

showAlertDialog3(BuildContext context) {
  // configura o button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Política de Dados"),
    content: Text(
      "Esta política descreve as informações que processamos para viabilizar a operação do Freckt. Você pode encontrar informações e ferramentas adicionais nos Termos De Uso do Freckt.",
    ),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

showAlertDialog4(BuildContext context) {
  // configura o button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Termos de Uso"),
    content: Text(
      "Bem-vindo(a) ao Freckt! \nEstes Termos de Uso (ou “Termos”) governam seu uso do Freckt, exceto quando afirmamos explicitamente que outros termos (e não estes) se aplicam, e fornecem informações sobre o Serviço do Freckt (o “Serviço”), descritas abaixo. Quando você cria uma conta do Freckt ou usa a plataforma do Freckt, você concorda com estes termos. Os Termos de Serviço do Google não se aplicam a esse Serviço.O Serviço Freckt é um dos Produtos do Google, fornecido a você pelo Freckt. Estes Termos de Uso, por conseguinte, constituem um acordo entre você e o Freckt.",
    ),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
