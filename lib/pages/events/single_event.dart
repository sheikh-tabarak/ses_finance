import 'package:flutter/material.dart';
import 'package:ses_finance/models/events.dart';

class SingleEvent extends StatefulWidget {
  final Event ClickedEvent;
  SingleEvent({super.key, required this.ClickedEvent});

  @override
  State<SingleEvent> createState() => _SingleEventState();
}

class _SingleEventState extends State<SingleEvent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
