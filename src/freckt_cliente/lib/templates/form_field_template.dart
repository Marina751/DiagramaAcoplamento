import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormFieldTemplate extends Container {
  FormFieldTemplate({
    @required String title,
    @required String hintText,
    @required TextInputType keyboardType,
    @required void Function(String) onSaved,
    @required String Function(String) validator,
    bool obscureText = false,
  }) : super(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(title),
              TextFormField(
                keyboardType: keyboardType,
                obscureText: obscureText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: hintText,
                ),
                validator: validator,
                onSaved: onSaved,
              )
            ],
          ),
        );
}
