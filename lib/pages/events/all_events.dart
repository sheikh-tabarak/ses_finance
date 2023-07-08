import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/BigText.dart';

class AllEvents extends StatefulWidget {
  const AllEvents({super.key});

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 54, 54, 54),
                ),
                child: ListTile(
                  title: BigText(
                    text: "Event ${index + 1}",
                    color: Colors.white,
                  ),
                  leading: Icon(Icons.event),
                ),
              )),
    );
  }
}
