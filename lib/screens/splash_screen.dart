import 'dart:async';

import 'package:anandan_demo_flutter/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      /* Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));*/
      context.pushReplacement('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.maxFinite,
        height: double.maxFinite,
        child: Center(
            child: Image.asset(
          "assets/images/anadan_logo.png",
          height: 150,
          width: 150,
        )),
      ),
    );
  }
}
