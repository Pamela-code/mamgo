import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonManngo extends StatefulWidget {
  const ButtonManngo({Key? key}) : super(key: key);

  @override
  State<ButtonManngo> createState() => _ButtonManngoState();
}

class _ButtonManngoState extends State<ButtonManngo> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: const Text('Enviar'),
    );
  }
}
