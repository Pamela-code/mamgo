import 'package:flutter/material.dart';

class TextFieldManngo extends StatefulWidget {
  const TextFieldManngo({Key? key, required this.label}) : super(key: key);
  final String label;

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
      keyboardType: TextInputType.emailAddress,
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Informe o seu email';
      //   } else if (email.hasMatch(value) == false) {
      //     return 'informe seu e-mail corretamente';
      //   }
      //   return null;
      // },
      // controller: controller.email,
      decoration: InputDecoration(
          labelText: widget.label, border: border, focusedBorder: border),
    );
  }
}
