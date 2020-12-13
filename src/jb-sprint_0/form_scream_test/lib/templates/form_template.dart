import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_scream_test/templates/form_field_template.dart';

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
            FormFieldTemplate(
              title: 'Title',
              hintText: 'Hint Text',
            ),
            FormFieldTemplate(
              title: 'Title',
              hintText: 'Hint Text',
            ),
            FormFieldTemplate(
              title: 'Title',
              hintText: 'Hint Text',
            ),
          ],
        ),
      ),
    );
  }
}
