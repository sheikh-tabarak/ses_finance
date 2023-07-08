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

Future AddNewTransactiontoEvent(
    String _EventId,
    String TransDate,
    String _TransactionDescription,
    double TransAmount,
    String _TransMode) async {
  double TotalIn = 0, TotalOut = 0, GrandTotal = 0;

  var currentEventBalance =
      await _db.collection("events").doc(_EventId).get().then((value) {
    TotalIn = value["TotalIn"];
    TotalOut = value["TotalOut"];
    GrandTotal = value["GrandTotal"];
  });

  print("Total In: ${TotalIn.toString()}");
  print("Total Out: ${TotalOut.toString()}");
  print("Grand Total: ${GrandTotal.toString()}");

  if (_TransMode == "Add") {
    TotalIn = TotalIn + TransAmount;
  } else if (_TransMode == "Subtract") {
    TotalOut = TotalOut + TransAmount;
  }

  GrandTotal = TotalIn - TotalOut;

  await _db.collection("events").doc(_EventId).update({
    'GrandTotal': GrandTotal,
    'TotalIn': TotalIn,
    'TotalOut': TotalOut,
  });

  final AddNewTransactionRequest =
      _db.collection("events").doc(_EventId).collection("transaction").doc();

  final NewTransaction = Transaction(
      EventId: _EventId,
      TransactionDate: TransDate,
      TransactionDescription: _TransactionDescription,
      TransactionMode: _TransMode,
      TransactionAmount: TransAmount);

  final json = NewTransaction.toJson();
  await AddNewTransactionRequest.set(json);
}
