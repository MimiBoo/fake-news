import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake/models/userdata.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService {
  final String uid;
  DatabaseService({@required this.uid});

  // collection reference
  final userCollection = Firestore.instance;

  // create new user or update existing
  Future updateUserData(
      String username, String firstName, String lastName, String email) async {
    return await userCollection.collection(uid).document().setData({
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    });
  }

  //user list from snapshot

  List<UserData> _usersFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return UserData(
        email: doc.data['email'] ?? '',
        username: doc.data['username'] ?? '',
        lastName: doc.data['lastName'] ?? '',
        firstName: doc.data['firstName'] ?? '',
      );
    }).toList();
  }

  //get users stream
  Stream<List<UserData>> get users {
    return userCollection.collection(uid).snapshots().map(_usersFromSnapshot);
  }
}
