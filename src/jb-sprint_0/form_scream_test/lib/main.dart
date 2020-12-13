import 'package:flutter/material.dart';
import 'package:form_scream_test/templates.dart';
import 'package:form_scream_test/terms_alert.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Title',
        home: Root(), //Home(),
      ),
    );

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Root')),
      body: Center(
        child: ElevatedButton(
          child: Text('Open template'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TemplateFormRegister(
                  body: Container(),
                  title: 'Title',
                  buttonText: 'Button Text',
                  bottomAppBar: TermsAlert(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
