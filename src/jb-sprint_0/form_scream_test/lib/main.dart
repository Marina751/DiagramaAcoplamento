import 'package:flutter/material.dart';
import 'package:form_scream_test/form_template.dart';
import 'package:form_scream_test/scaffold_template.dart';
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
                builder: (context) => ScaffoldTemplate(
                  body: FormTemplate(),
                  title: 'Title',
                  buttonText: 'Button Text',
                  //bottomAppBar: TermsAlert(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
