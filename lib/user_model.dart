class UserModel {
  String? name;
  int? age;

  UserModel({this.name, this.age});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] as String?,
        age: json['age'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };
}
