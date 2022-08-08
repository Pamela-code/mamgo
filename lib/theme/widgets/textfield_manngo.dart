import 'package:flutter/material.dart';

class TextFieldManngo extends StatefulWidget {
  TextFieldManngo({
    Key? key,
    required this.label,
    this.validator,
    this.controller,
    this.obscure = false,
  }) : super(key: key);
  final String label;
  final FormFieldValidator<String>? validator;
  TextEditingController? controller;
  final bool obscure;

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
      obscureText: widget.obscure,
      controller: widget.controller,
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
