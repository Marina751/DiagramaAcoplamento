import 'package:flutter/material.dart';

class TemplateFormRegister extends StatelessWidget {
  const TemplateFormRegister({
    @required this.body,
    @required this.title,
    @required this.buttonText,
    this.bottomAppBar,
  });

  final Widget body;
  final String title;
  final String buttonText;
  final BottomAppBar bottomAppBar;

  static const Color _black = Colors.black;
  static const Color _white = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
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
        floatingActionButton: Container(
          width: 300.0, // resize later
          child: FloatingActionButton.extended(
            onPressed: () {},
            backgroundColor: _black,
            label: Text(buttonText),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: bottomAppBar ?? BottomAppBar(),
        body: body,
      ),
    );
  }
}
