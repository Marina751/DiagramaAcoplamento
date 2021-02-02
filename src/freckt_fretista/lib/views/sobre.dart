import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:freckt_fretista/utils/consts.dart';

Text textWithColorTheme(String string) {
  return new Text(
    string,
    style: TextStyle(color: Consts.frecktThemeColor),
  );
}

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Consts.frecktThemeColor,
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
              title: textWithColorTheme('Termos de Uso'),
              onTap: () {
                showAlertDialog(context, 2);
              },
            ),
            ListTile(
              title: textWithColorTheme('Política de Dados'),
              onTap: () {
                showAlertDialog(context, 1);
              },
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, int opt) {
  // configura o button
  Widget okButton = FlatButton(
    textColor: Consts.frecktThemeColor,
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: textWithColorTheme(opt == 1 ? 'Política de Dados' : 'Termos de Uso'),
    content: Text(
      opt == 1
          ? 'Esta política descreve as informações que processamos para viabilizar a operação do Freckt. Você pode encontrar informações e ferramentas adicionais nos Termos De Uso do Freckt.'
          : 'Bem-vindo(a) ao Freckt! \nEstes Termos de Uso (ou “Termos”) governam seu uso do Freckt, exceto quando afirmamos explicitamente que outros termos (e não estes) se aplicam, e fornecem informações sobre o Serviço do Freckt (o “Serviço”), descritas abaixo. Quando você cria uma conta do Freckt ou usa a plataforma do Freckt, você concorda com estes termos. Os Termos de Serviço do Google não se aplicam a esse Serviço.O Serviço Freckt é um dos Produtos do Google, fornecido a você pelo Freckt. Estes Termos de Uso, por conseguinte, constituem um acordo entre você e o Freckt.',
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
