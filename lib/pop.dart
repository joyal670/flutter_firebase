import 'package:firebase/user_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void showPopUp(BuildContext context, DatabaseReference databaseReference) {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          title: Text('Add data to Firebase'),
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(hintText: 'Enter name'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Enter age'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (nameController.text.isEmpty ||
                            ageController.text.isEmpty) {
                          return;
                        } else {
                          final model = UserModel(
                              name: nameController.text,
                              age: int.parse(ageController.text));
                          databaseReference
                              .child(model.name.toString())
                              .set(model.toJson());
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text('Click here to Add'))
                ],
              ),
            ),
          ],
        );
      });
}
