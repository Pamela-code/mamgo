import 'package:flutter/material.dart';

class TextFieldManngo extends StatefulWidget {
  const TextFieldManngo({Key? key}) : super(key: key);

  @override
  State<TextFieldManngo> createState() => _TextFieldManngoState();
}

class _TextFieldManngoState extends State<TextFieldManngo> {
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
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
      ),
    );
  }
}
