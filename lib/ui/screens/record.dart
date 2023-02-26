import 'package:attendanceapp/ui/screens/class_groups.dart';
import 'package:flutter/material.dart';

class Records extends StatefulWidget {
  const Records({super.key});

  static const routeName = '/record';

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
         children: [
          Padding(
            padding: const EdgeInsets.only(top:50.0,bottom: 20),
            child: Text('Records',
              style: const TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),
              ),
          ),
           Center(
              child: Container(
                alignment: Alignment.center,
                 height: 310,
                 width: 350,
                 // margin: new EdgeInsets.symmetric(horizontal: 50,vertical: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.teal),
                              child: Center(
                                child: Text(
                                  'View Previous Record',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
           ),
           SizedBox(height: 60),
           Center(
              child: InkWell(
                child: Container(
                  alignment: Alignment.center,
                   height: 310,
                   width: 350,
                   // margin: new EdgeInsets.symmetric(horizontal: 50,vertical: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.teal),
                                child: Center(
                                  child: Text(
                                    'View New Record',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                 onTap: () {
                          Navigator.pushNamed(context, ClassGroups.routeName);
                        },
              ),
           ),
         ],
       ),
    );
  }
}
