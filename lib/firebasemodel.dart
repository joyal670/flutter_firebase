import 'package:firebase_database/firebase_database.dart';

class FirebaseModel {
  String? name;
  int? age;
  String? key;

  FirebaseModel({this.name, this.age});

  FirebaseModel.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };
}
