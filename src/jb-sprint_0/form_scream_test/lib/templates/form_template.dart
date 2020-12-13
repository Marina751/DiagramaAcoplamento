import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormTemplate extends StatefulWidget {
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
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                helperText: 'Helper Text TFF',
                labelText: 'Label Text',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Hint Text',
                helperText: 'Helper Text TF',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                helperText: 'Helper Text',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
