import 'package:flutter/material.dart';
import 'package:freckt_fretista/utils/consts.dart';

class Privacidade extends StatefulWidget {
  @override
  _PrivacidadeState createState() => _PrivacidadeState();
}

class _PrivacidadeState extends State<Privacidade> {
  bool _value1 = false;
  bool _value2 = false;
  //bool _value3 = false;

  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);
  //void _value3Changed(bool value) => setState(() => _value3 = value);

  Text textWithColorTheme(String string) {
    return new Text(
      string,
      style: TextStyle(color: Consts.frecktThemeColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Consts.frecktThemeColor,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Privacidade'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Text(
              //'Localização',
              //textAlign: TextAlign.left,
              //style: TextStyle(fontSize: 20.0),
              //),
              CheckboxListTile(
                value: _value1,
                onChanged: _value1Changed,
                activeColor: Consts.frecktThemeColor,
                title: textWithColorTheme('Localização'),
                subtitle: Text(
                  'Localização real quando não estou fretando (recomendado)',
                ),
              ),
              //Text(
              //  'Notificações',
              //  textAlign: TextAlign.left,
              //  style: TextStyle(fontSize: 20.0),
              //),
              SizedBox(height: 10.0),
              CheckboxListTile(
                value: _value2,
                onChanged: _value2Changed,
                activeColor: Consts.frecktThemeColor,
                title: textWithColorTheme('Notificações'),
                subtitle: Text(
                  'Receber notificações via push e por e-mail (recomendado)',
                ),
              ),
              //CheckboxListTile(
              //  value: _value3,
              //  onChanged: _value3Changed,
              //  subtitle: Text('Receber notificações por email'),
              //),
            ],
          ),
        ),
      ),
    );
  }
}
