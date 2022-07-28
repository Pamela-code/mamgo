import 'package:flutter/material.dart';
import 'package:mamgo/theme/widgets/button_manngo.dart';
import 'package:mamgo/theme/widgets/textfield_manngo.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/logo2.png'),
            Text('Faça Login'),
            TextFieldManngo(
              label: 'Email',
            ),
            TextFieldManngo(
              label: 'Senha',
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ButtonManngo(
                label: 'Login',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
