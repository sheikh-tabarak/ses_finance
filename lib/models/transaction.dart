// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

var _db = FirebaseFirestore.instance.collection("user").doc("SESSION_2022_23");

class Transaction {
  String EventId;
  String TransactionDate;
  String TransactionDescription;
  String TransactionMode;
  double TransactionAmount;
  Transaction({
    required this.EventId,
    required this.TransactionDate,
    required this.TransactionDescription,
    required this.TransactionMode,
    required this.TransactionAmount,
  });

  Map<String, dynamic> toJson() => {
        'EventId': EventId,
        'TransactionDate': TransactionDate,
        'TransactionDescription': TransactionDescription,
        'TransactionMode': TransactionMode,
        'TransactionAmount': TransactionAmount,
      };

  factory Transaction.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Transaction(
        EventId: data["EventId"],
        TransactionDate: data["TransactionDate"],
        TransactionDescription: data["TransactionDescription"],
        TransactionMode: data["TransactionMode"],
        TransactionAmount: data["TransactionAmount"]);
  }
}

Future AddNewTransactiontoEvent(String EventId, String TransDate,
    String TransactionDescription, double TransAmount, String TransMode) async {
  double TotalIn = 0, TotalOut = 0, GrandTotal = 0;

  // var currentEventBalance =
  await _db.collection("events").doc(EventId).get().then((value) {
    TotalIn = value["TotalIn"];
    TotalOut = value["TotalOut"];
    GrandTotal = value["GrandTotal"];
  });

  print("Total In: ${TotalIn.toString()}");
  print("Total Out: ${TotalOut.toString()}");
  print("Grand Total: ${GrandTotal.toString()}");

  if (TransMode == "Add") {
    TotalIn = TotalIn + TransAmount;
  } else if (TransMode == "Subtract") {
    TotalOut = TotalOut + TransAmount;
  }

  GrandTotal = TotalIn - TotalOut;

  await _db.collection("events").doc(EventId).update({
    'GrandTotal': GrandTotal,
    'TotalIn': TotalIn,
    'TotalOut': TotalOut,
  });

  final AddNewTransactionRequest =
      _db.collection("events").doc(EventId).collection("transaction").doc();

  final NewTransaction = Transaction(
      EventId: EventId,
      TransactionDate: TransDate,
      TransactionDescription: TransactionDescription,
      TransactionMode: TransMode,
      TransactionAmount: TransAmount);

  final json = NewTransaction.toJson();
  await AddNewTransactionRequest.set(json);
}

Stream<QuerySnapshot<Map<String, dynamic>>> AllTransactionofEvent(
    String EventId) {
  return _db
      .collection("events")
      .doc(EventId)
      .collection("transaction")
      .orderBy("TransactionDate", descending: true)
      .snapshots();
}

Stream<QuerySnapshot<Map<String, dynamic>>> All_Transactions() {
  return FirebaseFirestore.instance
      .collectionGroup("transaction")
      .orderBy("TransactionDate", descending: true)
      //  .orderBy("TransactionDate", descending: true)
      .snapshots();
}
