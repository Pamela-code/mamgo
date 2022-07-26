import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mamgo/auth/view/forgot_password_view.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                Image.asset('assets/logo2.png'),
                const SizedBox(
                  height: 15,
                ),
                const Text('Faça Login'),
                const SizedBox(
                  height: 15,
                ),
                Observer(builder: (_) {
                  return TextFieldManngo(
                    controller: controller.email,
                    label: 'Email',
                    validator: (String? valor) {
                      if (valor == "") {
                        return "Por favor preencha esse campo";
                      }
                      return null;
                    },
                  );
                }),
                const SizedBox(
                  height: 15,
                ),
                Observer(builder: (_) {
                  return TextFieldManngo(
                    controller: controller.senha,
                    obscure: true,
                    label: 'Senha',
                    validator: (String? valor) {
                      if (valor == "") {
                        return "Por favor preencha esse campo";
                      }
                      return null;
                    },
                  );
                }),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: Observer(
                    builder: (_) {
                      return ButtonManngo(
                        label: 'Login',
                        onPressed: () {
                          if (_keyForm.currentState!.validate()) {
                            controller.login();
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                            Future.delayed(
                              const Duration(
                                seconds: 3,
                              ),
                            ).then((value) {
                              Navigator.pop(context);
                              if (controller.auth.currentUser != null) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => QuizView(),
                                    ),
                                    (Route<dynamic> route) => false);
                              } else {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: const Icon(Icons.close),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          const Text(
                                            'Email ou senha incorretos',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }
                            });
                          }
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ButtonManngo(
                      label: 'Esqueci minha senha',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassword(),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 15,
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
      ),
    );
  }
}
