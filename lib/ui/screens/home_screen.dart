import 'package:attendanceapp/ui/auth/login_screen.dart';
import 'package:attendanceapp/ui/screens/class_groups.dart';
import 'package:attendanceapp/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;
  final colortheme = Colors.teal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        //  shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text(
          'Attendance',
          style: TextStyle(fontSize: 20, color: Colors.black),
        )),
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {
              auth.signOut().then((value) {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const LoginScreen()));
                Navigator.pushNamed(context, LoginScreen.routeName);
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),

      // body: Container(child:Padding(
      //   padding: const EdgeInsets.symmetric(vertical:40.0 ,horizontal: 20.0),
      //   child: GridView(children: [
      //     Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.red),),
      //     Container(color: Colors.yellow),
      //     Container(color: Colors.green),
      //     Container(color: Colors.grey),
      //   ],
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     mainAxisSpacing: 10,
      //     crossAxisSpacing: 10,
      //     childAspectRatio: 0.6,
      //     ),

      //   ),
      // ),),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          child: GridView.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6,
              ),
              itemBuilder: ((context, index) => InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.teal),
                      child: Center(
                        child: Text(
                          "$index",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, ClassGroups.routeName);
                    },
                  ))),
        ),
      ),

      // child: GridView(
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,  // number of columns
      //     crossAxisSpacing: 10, // space in a column
      //     mainAxisSpacing: 10, // space in a row
      //   ),
      //   children: [
      //     InkWell(
      //       child: Container(
      //         decoration: const BoxDecoration(
      //           color: Colors.grey,
      //         ),
      //         child: const Center(child: Text('1-2')),
      //       ),
      //       onTap: () {
      //         // Navigator.push(
      //         //   context,
      //         //   MaterialPageRoute(
      //         //     builder: ((context) => const ClassGroups()),
      //         //   ),
      //         // );
      //         Navigator.pushNamed(context, ClassGroups.routeName);
      //       },
      //     ),
      //     Container(
      //       color: Colors.grey,
      //       child: const Center(child: Text('3-4')),
      //     ),
      //     Container(
      //       color: Colors.grey,
      //       child: const Center(child: Text('5-6')),
      //     ),
      //     Container(
      //       color: Colors.grey,
      //       child: const Center(child: Text('7-8')),
      //     ),
      //   ],
      // ),
    );
  }
}
