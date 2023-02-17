import 'package:attendanceapp/ui/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:attendanceapp/ui/splash_screen.dart';

 void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // WidgetFlutterBinding is used to interact with flutter engine
  await Firebase.initializeApp(); // Firebase.initializedApp() needs to call native code to initialize firebase,
  // and since the plugns needs to use platform channels to call the native code,which is done asynchronously by calling ensureinitialized()
  //to make sure that we have an instance of widget binding. 
  // video in the group..  
  runApp(const MyApp(),);
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
      home: SplashScreen(),
    );
  }
}

