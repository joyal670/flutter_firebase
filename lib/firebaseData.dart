import 'package:firebase/user_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref().child('data_node').child('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                addDataToFirebase();
              },
              child: Text('Add Data')),
          ElevatedButton(
              onPressed: () {
                getDataFromFirebase();
              },
              child: Text('Get Data'))
        ],
      )),
    );
  }

  void addDataToFirebase() {
    final model = UserModel(name: "joyal", age: 20);
    databaseReference.child(model.name.toString()).set(model.toJson());
  }

  void getDataFromFirebase() {
    databaseReference.onValue.listen((event) {
      print(event.snapshot.value);

      // final model = UserModel.fromJson(event.snapshot);
      // event.snapshot.children.
    });
  }
}
