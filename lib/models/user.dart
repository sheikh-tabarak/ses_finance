// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, body_might_complete_normally_nullable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

var _db = FirebaseFirestore.instance.collection("user").doc("SESSION_2022_23");

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    return false;
  }
}

Future signout() async {
  await FirebaseAuth.instance.signOut();
}

Future updateNotes(String NotesData) async {
  await _db.collection("notes").doc("ses_notes").update({
    'NotesText': NotesData,
  });
}

Future<String?> getNotes() async {
  String _NotesName = "N/A";
  // var currentEventBalance =
  await _db.collection("notes").doc("ses_notes").get().then((value) {
    _NotesName = value["NotesText"];

    return _NotesName;
  });
}
