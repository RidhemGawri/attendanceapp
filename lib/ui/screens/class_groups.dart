import 'package:attendanceapp/providers/class_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassGroups extends StatefulWidget {
  const ClassGroups({super.key});

  static const routeName = '/class_groups';

  @override
  State<ClassGroups> createState() => _ClassGroupsState();
}

class _ClassGroupsState extends State<ClassGroups> {
  bool? _isChecked = false;
  @override
  Widget build(BuildContext context) {
    //getting the name of class we are in
    final className = ModalRoute.of(context)?.settings.arguments as String;

    final loadedClass = Provider.of<ClassProvider>(context).findById(
        className); //this findById method is defined in class_provider.dart file

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(loadedClass.name),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(text: 'C-1'),
            Tab(text: 'C-2'),
          ]),
        ),
        body: TabBarView(children: [
          CheckboxListTile(
            title: const Text('12001190 - ABCD'),
            value: _isChecked,
            onChanged: (bool? newValue) {
              setState(() {
                _isChecked = newValue;
              });
            },
            //  activeColor: Colors.white,
            // checkColor: Colors.black,
          ),
          CheckboxListTile(
              title: const Text('12001141 - XYZ'),
              value: _isChecked,
              onChanged: (bool? newValue) {
                setState(() {
                  _isChecked = newValue;
                });
              }),
        ]),
        // body: NestedScrollView(
        //   headerSliverBuilder:(context, innerBoxIsScrolled) => [
        //   SliverAppBar(
        //     floating: true,
        //     snap: true,
        //     title: Text('Hide'),
        //     centerTitle: true,
        //     ),
        //    ],
        //    body: ListView.builder(
        //     itemBuilder: (context,index) => ListTile(
        //       title: Text(
        //          'Item ${index +1}',
        //           style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100),
        //       ),
        //     ),
        //     )
        //   ),

        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.save),
        ),
      ),
    );
  }
}
