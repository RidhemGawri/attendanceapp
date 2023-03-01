import 'package:attendanceapp/ui/screens/calendar.dart';
import 'package:attendanceapp/ui/screens/class_groups.dart';
import 'package:attendanceapp/ui/screens/previous_record_screen.dart';

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
    final className = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title:  Text(className),
      ),
       body: Center(
         child: Column(

           children:[
            // Row(
            //   children: [
            //     IconButton(
            //     icon: const Icon(Icons.arrow_back),
            //     onPressed: (){
            //       Navigator.pop(context);
            //     },
            //    ),
            //    const SizedBox(width: 2),
            //     Text('Records',
            //     style: const TextStyle(fontSize: 21.0,fontWeight: FontWeight.bold),
            //     ),
            //    ],
            //   ),
             // SizedBox(height: 20),
              InkWell(
                onTap:(){ Navigator.pushNamed(context, PreviousRecordScreen.routeName , arguments: className);},
                child: Container(
                    alignment: Alignment.center,
                     height: 200,
                     width: 200,
                     // margin: new EdgeInsets.symmetric(horizontal: 50,vertical: 50),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.teal),
                                  child: const Center(
                                    child: Text(
                                      'View Previous Record',
                                      style:  TextStyle(fontSize: 20),
                                    ),
                                  ),

                                ),
              ),

             const SizedBox(height: 50),
              InkWell(
                  child: Container(
                    alignment: Alignment.center,
                     height: 200,
                     width: 200,
                     // margin: new EdgeInsets.symmetric(horizontal: 50,vertical: 50),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.teal),
                                  child: const Center(
                                    child: Text(
                                      'View New Record',
                                      style:  TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                   onTap: () {
                            Navigator.pushNamed(context, Calender.routeName,arguments: className );
                          },
                ),

           ],
         ),
       ),
    );
  }
}
