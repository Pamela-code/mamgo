import 'package:flutter/material.dart';

class ButtonManngo extends StatefulWidget {
  const ButtonManngo({Key? key, required this.label, required this.onPressed})
      : super(key: key);
  final String label;
  final VoidCallback? onPressed;

  @override
  State<ButtonManngo> createState() => _ButtonManngoState();
}

class _ButtonManngoState extends State<ButtonManngo> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
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
