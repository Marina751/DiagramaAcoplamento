import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Title',
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const Color _primaryColor = Colors.black;
  static const Color _secundaryColor = Colors.white;
  String _imcStatus = 'Informe seus dados';
  TextEditingController weigthController = TextEditingController();
  TextEditingController heigthController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _setText(String str) {
    setState(() {
      _imcStatus = str;
    });
  }

  void _refresh() {
    weigthController.clear();
    heigthController.clear();

    _setText('Informe seus dados');
  }

  void _imcCalculate() {
    double weigth = double.parse(weigthController.text);
    double heigth = double.parse(heigthController.text) / 100;
    double imc = weigth / (heigth * heigth);

    _setText('Seu imc é ${imc.toStringAsPrecision(4)}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
            color: _primaryColor,
          ),
          title: Text(
            'IMC',
            style: TextStyle(
              color: _primaryColor,
            ),
          ),
          backgroundColor: _secundaryColor,
          actions: [
            IconButton(
                icon: Icon(Icons.refresh),
                color: _primaryColor,
                onPressed: _refresh)
          ],
        ),
        //Ao se cadastrar, você concorda com os Termos de Serviço e
//Política de Privacidade do Freckt
        bottomNavigationBar: BottomAppBar(
          child: Text.rich(
            TextSpan(
              text: 'Ao se cadastrar, você concorda com os ',
              children: <TextSpan>[
                TextSpan(
                  text: 'Termos de Serviço',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                TextSpan(text: ' e '),
                TextSpan(
                  text: 'Política de Privacidade',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                TextSpan(text: ' do Freckt'),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: _secundaryColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.person_outline,
                  color: _primaryColor,
                  size: 220.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Altura (cm)',
                    labelStyle: TextStyle(color: _primaryColor),
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, color: _primaryColor),
                  controller: heigthController,
                  validator: (value) {
                    if (value.isEmpty) return 'Precisa inserir a altura';
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Peso (kg)',
                    labelStyle: TextStyle(color: _primaryColor),
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, color: _primaryColor),
                  controller: weigthController,
                  validator: (value) {
                    if (value.isEmpty) return 'Precisa inserir o peso';
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate())
                          _imcCalculate();
                        else
                          _setText('Informe seus dados');
                      },
                      child: Text(
                        'Calcular',
                        style:
                            TextStyle(color: _secundaryColor, fontSize: 24.0),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      color: _primaryColor,
                    ),
                  ),
                ),
                Text(
                  _imcStatus,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _primaryColor,
                    fontSize: 24.0,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
