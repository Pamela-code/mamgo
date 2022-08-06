import 'package:flutter/material.dart';

class TextFieldManngo extends StatefulWidget {
  const TextFieldManngo({Key? key, required this.label, this.validator})
      : super(key: key);
  final String label;
  final FormFieldValidator<String>? validator;

  @override
  State<TextFieldManngo> createState() => _TextFieldManngoState();
}

class _TextFieldManngoState extends State<TextFieldManngo> {
  final OutlineInputBorder border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(
        10,
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: widget.label,
        border: border,
        focusedBorder: border,
      ),
    );
  }
}
