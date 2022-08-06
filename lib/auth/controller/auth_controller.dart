import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

import '../service/auth_service.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  @observable
  TextEditingController name = TextEditingController();

  @observable
  TextEditingController email = TextEditingController();

  @observable
  TextEditingController senha = TextEditingController();

  @action
  createUser() async {
    try {
      await AuthService().createUser(email.text, senha.text);
    } catch (e) {
      debugPrint(e.toString());
    }
    await AuthService().createUser(email.text, senha.text);
  }

  @action
  login() async {
    try {
      await AuthService().login(email.text, senha.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    }
  }

  @action
  resetPasswordEmail() {
    try {
      AuthService().sendPasswordResetEmail(email.text);
    } catch (e) {
      print(e);
    }
  }
}
