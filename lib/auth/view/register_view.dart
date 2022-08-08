import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mamgo/auth/controller/auth_controller.dart';
import 'package:mamgo/theme/widgets/button_manngo.dart';
import 'package:mamgo/theme/widgets/textfield_manngo.dart';

import '../../quiz/view/quiz_view.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({Key? key}) : super(key: key);

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/logo2.png'),
                const SizedBox(
                  height: 15,
                ),
                const Text('Faça Seu Cadastro'),
                const SizedBox(
                  height: 15,
                ),
                Observer(builder: (_) {
                  return TextFieldManngo(
                    controller: controller.name,
                    label: 'Nome',
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
                          label: 'Cadastrar',
                          onPressed: () {
                            if (_keyForm.currentState!.validate()) {
                              controller.createUser();
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
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            const Text(
                                              'Algo deu errado',
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
                          });
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
                      label: 'Cancelar',
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
