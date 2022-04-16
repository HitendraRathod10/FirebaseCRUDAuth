import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseemail/model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

class Database{

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  /*FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference? _users;

  Stream get allUsers => _firestore.collection("users").snapshots();

  Future<bool> addNewUser(User m) async {
    _users = _firestore.collection('users');
    try {
      await _users!.add(
          {'fname': m.fname, 'lname': m.lname, 'mail': m.mail, 'phone': m.phone});
      return true; // finally return true
    } catch (e) {
      return Future.error(e); // return error
    }
  }*/
}
// final databaseProvider = Provider((ref) => Database());