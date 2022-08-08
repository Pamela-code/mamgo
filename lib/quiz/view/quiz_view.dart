import 'package:flutter/material.dart';

import '../../auth/controller/auth_controller.dart';
import '../../theme/widgets/button_manngo.dart';

class QuizView extends StatelessWidget {
  QuizView({Key? key}) : super(key: key);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Seja bem vindo ao'),
            Image.asset('assets/logo2.png'),
            const Text(
              'A seguir, você deve responder algumas perguntas',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ButtonManngo(label: 'Iniciar', onPressed: () {}),
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ButtonManngo(
                  label: 'Logout',
                  onPressed: () {
                    controller.logout();
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
