import 'package:cloud_firestore/cloud_firestore.dart';

class User1 {
  final String name;
  final String surname;
  final String birthday;
  final int age;
  User1({
    required this.name,
    required this.surname,
    required this.birthday,
    required this.age,
  });

  Map<String, dynamic> toJson() =>
      { 'name': name,'surname': surname,'birthday': birthday,'age': age,};

  static User1 fromJson(Map<String, dynamic>json) =>
      User1(name: json['name'],
      surname: json['surname'],
        birthday: json['birthday'],
      age: json['age'],
      );
}
