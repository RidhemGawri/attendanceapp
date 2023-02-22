import 'package:attendanceapp/ui/auth/login_screen.dart';
import 'package:attendanceapp/ui/screens/class_groups.dart';
import 'package:attendanceapp/ui/screens/home_screen.dart';
import 'package:attendanceapp/ui/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // WidgetFlutterBinding is used to interact with flutter engine
  await Firebase
      .initializeApp(); // Firebase.initializedApp() needs to call native code to initialize firebase,
  // and since the plugins needs to use platform channels to call the native code,which is done asynchronously by calling ensureinitialized()
  //to make sure that we have an instance of widget binding.
  // video in the group..
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const SplashScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
      //  SignUpScreen.routeName: (ctx) => const SignUpScreen(),
        ClassGroups.routeName: (ctx) => const ClassGroups(),
      },
    );
  }
}
