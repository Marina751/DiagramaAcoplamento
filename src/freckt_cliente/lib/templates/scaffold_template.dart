import 'package:flutter/material.dart';
import 'package:freckt_cliente/templates/elevated_button_template.dart';
import 'package:freckt_cliente/templates/terms_alert.dart';

class ScaffoldTemplate extends StatelessWidget {
  const ScaffoldTemplate({
    Key key,
    @required this.body,
    @required this.title,
    @required this.button,
    this.hasAlertTerms = true,
  }) : super(key: key);

  final Widget body;
  final String title;
  final bool hasAlertTerms;
  final ElevatedButtonTemplate button;

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
        height: hasAlertTerms ? 130.0 : 90.0,
        padding: EdgeInsets.only(top: 5.0),
        child: Column(
          children: [
            button,
            hasAlertTerms ? TermsAlert() : Container(),
          ],
        ),
      ),
    );
  }
}
