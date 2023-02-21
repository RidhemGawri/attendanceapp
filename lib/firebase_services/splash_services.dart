import 'dart:async';

import 'package:attendanceapp/ui/auth/login_screen.dart';
import 'package:attendanceapp/ui/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(
        const Duration(seconds: 2),
        // () => Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => HomeScreen()))
        () => Navigator.pushNamed(context, HomeScreen.routeName),
      );
    } else {
      Timer(
        const Duration(seconds: 2),
        // () => Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => LoginScreen())),
        () => Navigator.pushNamed(context, LoginScreen.routeName),
      );
    }
  }
}
