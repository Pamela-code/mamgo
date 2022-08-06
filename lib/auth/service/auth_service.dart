import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future createUser(String email, String password) async {
    auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future login(String email, String password) async {
    auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future sendPasswordResetEmail(email) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
