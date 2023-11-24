import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text;

  final String? hint;

  final Function(String?) onSave;
  final Function(String?) validator;

  const CustomTextFormField({
    Key? key,
    this.text,
    this.hint,
    required this.onSave,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text!,
          fontSize: 14,
          color: Colors.grey.shade900,
        ),
        TextFormField(
          onSaved: (newValue) => onSave(newValue),
          validator: (value) => validator(value),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black),
            fillColor: Colors.white,
          ),
        )
      ],
    );
  }
}
