import 'package:flutter/material.dart';
import 'package:freckt_fretista/utils/consts.dart';

class SubmenuScaffoldTemplate extends StatelessWidget {
  const SubmenuScaffoldTemplate({
    Key key,
    @required this.body,
    @required this.title,
    this.hasAlertTerms = true,
  }) : super(key: key);

  final Widget body;
  final String title;
  final bool hasAlertTerms;

  //static const Color _black = Colors.black;
  static Color _teal = Consts.frecktThemeColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _teal,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          title,
          //style: TextStyle(color: _black),
        ),
      ),
      body: Padding(padding: EdgeInsets.all(10.0), child: body),
    );
  }
}
