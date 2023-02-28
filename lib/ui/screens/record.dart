import 'package:attendanceapp/ui/screens/calendar.dart';
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
         children:[
          Row(
            children: [
              IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pop(context);
              },
             ),
             SizedBox(width: 2),
              Text('Records',
              style: const TextStyle(fontSize: 21.0,fontWeight: FontWeight.bold),
              ),
             ],
            ),
            SizedBox(height: 20),
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
           SizedBox(height: 50),
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
                          Navigator.pushNamed(context, Calender.routeName);
                        },
              ),
           ),
         ],
       ),
    );
  }
}
