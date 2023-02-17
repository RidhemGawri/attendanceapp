import 'package:attendanceapp/ui/home/class_groups.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:attendanceapp/ui/auth/login_screen.dart';
import 'package:attendanceapp/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Attendance')),
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
     body:Center(
        child: GridView(
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
           crossAxisSpacing: 10, // space in a column 
           mainAxisSpacing: 10,  // space in a row
           ),
           children: [
             InkWell(
               child: Container(
                 decoration: BoxDecoration(
                   color: Colors.grey,
                 ),
                 child: Center(child: Text('1-2')),
               ),
               onTap:() {
                   Navigator.push(context,MaterialPageRoute(builder: ((context) => ClassGroups()),),);
               },
             ),
            Container(color: Colors.grey,
             child: Center(child: Text('3-4')),
             ),
             Container(color: Colors.grey,
             child: Center(child: Text('5-6')),
             ),
             Container(color: Colors.grey,
             child: Center(child: Text('7-8')),
             ),
           ],
        ),
     ),
    );
  }
}
