import 'package:flutter/material.dart';

class Entrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.arrow_back, size: 20.0),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 0.0, 50.0, 0.0),
                    child: Text(
                      "Entrar",
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(100),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Login",
                        labelStyle: TextStyle(color: Colors.grey),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "***",
                        labelStyle: TextStyle(color: Colors.grey),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: ButtonTheme(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () => {},
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0)),
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ), //Text
                      color: Colors.black,
                    ),
                  ), //RaisedButton
                ), //ButtonTheme
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: FlatButton(
                    child: Text(
                      "Esqueceu sua Senha?",
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
