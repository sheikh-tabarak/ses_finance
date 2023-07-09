// ignore_for_file: must_be_immutable, non_constant_identifier_names, use_build_context_synchronously, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/configurations/SmallText.dart';
import 'package:ses_finance/models/events.dart';
import 'package:ses_finance/pages/events/single_event.dart';
import 'package:ses_finance/pages/loading.dart';
import 'package:ses_finance/widgets/no_data.dart';

class AllEvents extends StatefulWidget {
  int Event_Index;
  //Event ClickedEvent;
  AllEvents({
    Key? key,
    this.Event_Index = 0,
    // required this.ClickedEvent,
  }) : super(key: key);

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  final DateFormat Dateformatter = DateFormat('dd/MM HH:mm');
  bool _isLoading = false;
  Event ClickedEvent = Event(
      EventId: "",
      StartDate: "",
      Eventtitle: "",
      Eventdescription: "",
      TotalIn: 0,
      TotalOut: 0,
      GrandTotal: 0);

  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? Loading(
            message: "Deleting Event",
          )
        : widget.Event_Index == 0 && _isLoading == false
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "All Events"),
                  const SizedBox(
                    height: 15,
                  ),
                  StreamBuilder(
                      stream: AllEventsData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.docs.isNotEmpty) {
                            return ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: snapshot.data!.docs.map((e) {
                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 54, 54, 54),
                                  ),
                                  child: ListTile(
                                      onTap: () {
                                        setState(() {
                                          widget.Event_Index = 1;
                                          ClickedEvent = Event(
                                              EventId: e["EventId"],
                                              StartDate: e["StartDate"],
                                              Eventtitle: e["Eventtitle"],
                                              Eventdescription:
                                                  e["Eventdescription"],
                                              TotalIn: e["TotalIn"],
                                              TotalOut: e["TotalOut"],
                                              GrandTotal: e["GrandTotal"]);
                                        });
                                      },
                                      title: BigText(
                                        text: e["Eventtitle"],
                                        color: Colors.white,
                                      ),
                                      subtitle: SmallText(
                                          text: e["Eventdescription"]),
                                      leading: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          BigText(
                                              text: DateFormat("dd").format(
                                                  DateTime.parse(e["StartDate"]
                                                      .toString()))),
                                          SmallText(
                                              text: DateFormat("MMMM").format(
                                                  DateTime.parse(e["StartDate"]
                                                      .toString())))
                                        ],
                                      ),
                                      //const Icon(Icons.arrow_forward_ios),
                                      //Icon(Icons.event),
                                      trailing: BigText(
                                        text: e["GrandTotal"].toString(),
                                        color: e["GrandTotal"] < 0
                                            ? Colors.red
                                            : Colors.green,
                                      )),
                                );
                              }).toList(),
                            );
                          } else {
                            return const NoData();
                          }
                        } else {
                          return const NoData();
                        }
                      }),
                ],
              )
            : widget.Event_Index == 1 && _isLoading == false
                ? SingleEvent(
                    ClickedEvent: ClickedEvent,
                  )
                : Text("Index you entered: ${widget.Event_Index}");
  }
}
