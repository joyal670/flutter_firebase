import 'package:firebase/user_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void showPopUp(BuildContext context, DatabaseReference databaseReference,
    String? name, String? age, bool? isEdit) {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final isEditValue = isEdit;

  if (name != "") {
    nameController.text = name!;
    ageController.text = age!;
  }
  String buttonText;
  if (isEdit!) {
    buttonText = "Update";
  } else {
    buttonText = "Click here to Add";
  }
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
                      child: Text(buttonText)),
                  if (isEditValue!)
                    ElevatedButton.icon(
                        onPressed: () {
                          databaseReference.child(name!).remove();
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.delete),
                        label: Text('Delete'))
                ],
              ),
            ),
          ],
        );
      });
}
