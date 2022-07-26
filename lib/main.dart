import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mamgo/quiz/view/question_view.dart';
import 'package:mamgo/quiz/view/quiz_view.dart';
import 'package:mamgo/splash/view/splash_view.dart';
import 'package:mamgo/submit/view/submit_view.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manngo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:
          // QuizView(),
          const SubmitView(),
    );
  }
}
