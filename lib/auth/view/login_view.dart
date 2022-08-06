import 'package:flutter/material.dart';
import 'package:mamgo/auth/view/register_view.dart';
import 'package:mamgo/quiz/view/quiz_view.dart';
import 'package:mamgo/theme/widgets/button_manngo.dart';
import 'package:mamgo/theme/widgets/textfield_manngo.dart';

import '../controller/auth_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _keyForm = GlobalKey<FormState>();
  AuthController controller = AuthController();
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
        child: Form(
          key: _keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/logo2.png'),
              const Text('Faça Login'),
              TextFieldManngo(
                label: 'Email',
                validator: (String? valor) {
                  if (valor == "") {
                    return "Por favor preencha esse campo";
                  }
                  return null;
                },
              ),
              TextFieldManngo(
                label: 'Senha',
                validator: (String? valor) {
                  if (valor == "") {
                    return "Por favor preencha esse campo";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ButtonManngo(
                    label: 'Login',
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        controller.login();
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const QuizView(),
                      //   ),
                      // );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Ainda não tem uma conta? '),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CadastroView(),
                        ),
                      );
                    },
                    child: const Text('Cadastre-se'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
