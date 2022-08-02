import 'package:flutter/material.dart';
import 'package:mamgo/auth/view/login_view.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
    ).then((_) => Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
        (Route<dynamic> route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xff46d347),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/logo.png',
            ),
          ),
        ],
      ),
    );
  }
}
