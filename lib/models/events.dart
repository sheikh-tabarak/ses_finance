import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart';

var _db = FirebaseFirestore.instance.collection("user").doc("SESSION_2022_23");

class Event {
  String StartDate;
  String EventId;
  String Eventtitle;
  String Eventdescription;
  double TotalIn;
  double TotalOut;
  double GrandTotal;
  Event({
    required this.StartDate,
    required this.EventId,
    required this.Eventtitle,
    required this.Eventdescription,
    required this.TotalIn,
    required this.TotalOut,
    required this.GrandTotal,
  });

  Map<String, dynamic> toJson() => {
        'StartDate': StartDate,
        'EventId': EventId,
        'Eventtitle': Eventtitle,
        'Eventdescription': Eventdescription,
        'TotalIn': TotalIn,
        'TotalOut': TotalOut,
        'GrandTotal': GrandTotal,
      };

  factory Event.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Event(
      StartDate: data["StartDate"],
      EventId: data["EventId"],
      Eventtitle: data["Eventtitle"],
      Eventdescription: data["Eventdescription"],
      TotalIn: data["TotalIn"],
      TotalOut: data["TotalOut"],
      GrandTotal: data["GrandTotal"],
    );
  }
}

Future AddNewEvent(
    String EventTitle, String EventDescription, String EventStartDate) async {
  final AddEventRequest = _db.collection("events").doc();
  final NewEventObject = Event(
      StartDate: EventStartDate,
      EventId: AddEventRequest.id,
      Eventtitle: EventTitle,
      Eventdescription: EventDescription,
      TotalIn: 0,
      TotalOut: 0,
      GrandTotal: 0);

  final json = NewEventObject.toJson();
  await AddEventRequest.set(json);
}

Future EditEvent(
  String EventId,
  String Event_Title,
  String Event_Description,
) async {
  await _db.collection("events").doc(EventId).update({
    'EventTitle': Event_Title,
    'Eventdescription': Event_Description,
  });
}

Future deleteEvent(String EventId) async {
  await _db.collection("events").doc(EventId).delete().then((value) {
    print("Event deleted");
  });
}

Stream<QuerySnapshot<Map<String, dynamic>>> AllEventsData() {
  return _db
      .collection("events")
      .orderBy("StartDate", descending: true)
      .snapshots();
}
