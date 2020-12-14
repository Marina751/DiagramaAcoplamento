import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormFieldTemplate extends Container {
  FormFieldTemplate({@required String title, @required String hintText})
      : super(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(title),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: hintText,
                ),
              )
            ],
          ),
        );
}
