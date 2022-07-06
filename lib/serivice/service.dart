import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data/model/user_model.dart';


Stream<List<User1>> readUsers() {
 FirebaseFirestore.instance.collection("users");
  return FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      return User1.fromJson(doc.data());
    }).toList();
  });
}

Future createUser(User1 User) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();
  final json = User.toJson();
  await docUser.set(json);
}
