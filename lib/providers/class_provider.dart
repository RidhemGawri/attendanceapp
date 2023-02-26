import 'package:attendanceapp/models/class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClassProvider with ChangeNotifier {
  final CollectionReference classList = FirebaseFirestore.instance.collection(
      "classes"); //this is the collection reference to classes collection

  final List<Class> _classes = [
    // Class(name: "3CE12", subject: "ML", instructor: "Navdeep"),
    // Class(name: "3CE34", subject: "ML", instructor: "Navdeep"),
    // Class(name: "3CE56", subject: "ML", instructor: "Navdeep"),
    // Class(name: "3CE78", subject: "ML", instructor: "Navdeep"),
  ];

  //method to get the list of classes from firebase
  Future getClassesList() async {
    await classList.get().then((querySnapshot) {
      //querySnapshot is the list of all the documents in classes collection
      for (var element in querySnapshot.docs) {
        _classes.add(Class(
            name: element.get("className"),
            subject: element.get("subject"),
            instructor: element.get("instructor")));
      }
    });
    notifyListeners();
  }

  List<Class> get classes {     // getter function
    getClassesList(); //calling the classes function
    return [..._classes];  // ... is used because the copy of that data is stored in classes variable
  }

  Class findById(String className) {
    return _classes.firstWhere((element) => element.name == className);
  }
}
