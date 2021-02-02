import 'package:flutter/material.dart';

class Privacidade extends StatefulWidget {
  @override
  _PrivacidadeState createState() => _PrivacidadeState();
}

class _PrivacidadeState extends State<Privacidade> {
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;

  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);
  void _value3Changed(bool value) => setState(() => _value3 = value);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff20B8A6),
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
            children: <Widget>[
              Text(
                'Localização',
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 20.0),
              ),
              CheckboxListTile(
                value: _value1,
                onChanged: _value1Changed,
                title: Text(
                  'Localização real quando não estou fretando (recomendado)',
                ),
              ),
              Text(
                'Notificações',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20.0),
              ),
              CheckboxListTile(
                value: _value2,
                onChanged: _value2Changed,
                title: Text('Receber notificações push (recomendado)'),
              ),
              CheckboxListTile(
                value: _value3,
                onChanged: _value3Changed,
                title: Text('Receber notificações por email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
