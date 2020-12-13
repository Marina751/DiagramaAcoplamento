import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormTemplate extends StatefulWidget {
  final List<Widget> children;

  const FormTemplate({Key key, @required this.children});

  @override
  _FormTemplateState createState() => _FormTemplateState();
}

class _FormTemplateState extends State<FormTemplate> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Form(
        child: Column(
          children: widget.children,
        ),
      ),
    );
  }
}
