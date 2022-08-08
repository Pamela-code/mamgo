import 'package:flutter/material.dart';
import 'package:mamgo/theme/widgets/button_manngo.dart';
import 'package:mamgo/theme/widgets/textfield_manngo.dart';

import '../controller/auth_controller.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  AuthController controller = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 47),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: const [
                Text(
                  'Esqueceu sua senha?',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Digite seu email e lhe enviaremos o link para redefinição de senha',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            TextFieldManngo(label: 'Email'),
            ButtonManngo(
                label: 'Continuar',
                onPressed: () {
                  controller.resetPasswordEmail();
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // IconButton(
                                  //   onPressed: () {
                                  //     Navigator.pop(context);
                                  //     Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const LoginView(),
                                  //       ),
                                  //     );
                                  //   },
                                  //   icon:
                                  //       SvgPicture.asset('assets/svg/x.svg'),
                                  // ),
                                ],
                              ),
                              // SvgPicture.asset(
                              //   'assets/svg/check.svg',
                              //   height: 160,
                              // ),
                              const SizedBox(
                                height: 25,
                              ),
                              const Text(
                                'Email de redefinição de senha enviado com sucesso. Por favor, verifique sua caixa de spam.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        );
                      });
                }),
            ButtonManngo(
                label: 'Cancelar',
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
