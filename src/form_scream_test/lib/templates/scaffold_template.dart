import 'package:flutter/material.dart';
import 'package:form_scream_test/templates/button_template.dart';
import 'package:form_scream_test/terms_alert.dart';

class ScaffoldTemplate extends StatelessWidget {
  const ScaffoldTemplate({
    Key key,
    @required this.body,
    @required this.title,
    @required this.buttonText,
    this.hasAlertTerms = true,
  }) : super(key: key);

  final Widget body;
  final String title;
  final String buttonText;
  final bool hasAlertTerms;

  static const Color _black = Colors.black;
  static const Color _white = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _white,
        leading: IconButton(
          color: _black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          title,
          style: TextStyle(color: _black),
        ),
      ),
      body: body,
      bottomNavigationBar: Container(
        color: _white,
        height: hasAlertTerms ? 110.0 : 90.0,
        padding: EdgeInsets.only(top: 5.0),
        child: Column(
          children: [
            ButtonTemplate(
              onPressed: () {},
              buttonText: buttonText,
            ),
            hasAlertTerms ? TermsAlert() : Container(),
          ],
        ),
      ),
    );
  }
}
