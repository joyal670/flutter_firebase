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
    final model = UserModel(name: "joe", age: 20);
    databaseReference.child(model.name.toString()).set(model.toJson());
  }

  void getDataFromFirebase() {
    // databaseReference.onValue.listen((event) {
    //   print(event.snapshot.value);
    // });
    // databaseReference.child('joe/age').onValue.listen((event) {
    //   print("2nd${event.snapshot.value}");
    // });

    // databaseReference.child('joe').onValue.listen((event) {
    //   UserModel model = UserModel.fromJson(event.snapshot.value as Map);
    //   print(model.age);
    // });

    // databaseReference.onValue.listen((event) {
    //   List<NewUserModel> userList = [];
    //   UserModel model = UserModel.fromJson(event.snapshot.value as Map);
    //   NewUserModel newUserModel =
    //       NewUserModel(key: event.snapshot.key, model: model);

    //   userList.add(newUserModel);

    //   print(newUserModel.model);
    //   print(userList);
    // });

    List<UserModel> listData = [];
    databaseReference.onValue.listen((event) {
      for (final element in event.snapshot.children) {
        UserModel model = UserModel.fromJson(element.value as Map);
        listData.add(model);
      }

      print(listData.toList());

      //  print(event.snapshot.value.toString());
    });
  }
}
