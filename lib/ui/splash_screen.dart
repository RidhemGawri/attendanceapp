import 'package:flutter/material.dart';
import 'package:attendanceapp/firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget { 
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Attendance App',style: TextStyle(fontSize: 30),),
      ),
    );
  }
}