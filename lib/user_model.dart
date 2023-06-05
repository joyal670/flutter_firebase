// class UserModel {
//   String? name;
//   int? age;

//   UserModel({this.name, this.age});

//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         name: json['name'] as String?,
//         age: json['age'] as int?,
//       );

//   Map<String, dynamic> toJson() => {
//         'name': name,
//         'age': age,
//       };
// }
class UserModel {
  String? name;
  int? age;

  UserModel({this.name, this.age});

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };
}

class NewUserModel {
  String? key;
  UserModel? model;

  NewUserModel({this.key, this.model});
}
