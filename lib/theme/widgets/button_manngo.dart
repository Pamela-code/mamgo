import 'package:flutter/material.dart';

class ButtonManngo extends StatefulWidget {
  const ButtonManngo({Key? key, required this.label}) : super(key: key);
  final String label;

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
      child: Text(widget.label),
    );
  }
}
