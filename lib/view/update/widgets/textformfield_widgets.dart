import 'package:flutter/material.dart';

class TextFormFieldWidgets extends StatelessWidget {
  final String? text;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final bool? readOnly;
  const TextFormFieldWidgets(
      {Key? key, this.text, this.inputType, this.controller, this.readOnly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $text';
        }
        return null;
      },
      readOnly: readOnly ?? false,
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: text,
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
