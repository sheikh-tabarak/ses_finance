import 'package:flutter/material.dart';

import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/configurations/SmallText.dart';
import 'package:ses_finance/models/events.dart';
import 'package:ses_finance/pages/events/subpages/add_transaction.dart';
import 'package:ses_finance/pages/loading.dart';
import 'package:ses_finance/responsive.dart';
import 'package:ses_finance/widgets/no_data.dart';

class AllEvents extends StatefulWidget {
  int Event_Index;
  AllEvents({
    Key? key,
    this.Event_Index = 0,
  }) : super(key: key);

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
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
            ? StreamBuilder(
                stream: AllEventsData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.isNotEmpty) {
                      return Container(
                          child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
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
                                        Eventdescription: e["Eventdescription"],
                                        TotalIn: e["TotalIn"],
                                        TotalOut: e["TotalOut"],
                                        GrandTotal: e["GrandTotal"]);
                                  });
                                },
                                title: BigText(
                                  text: e["Eventtitle"],
                                  color: Colors.white,
                                ),
                                subtitle:
                                    SmallText(text: e["Eventdescription"]),
                                leading: Icon(Icons.arrow_forward_ios),
                                //Icon(Icons.event),
                                trailing: BigText(
                                  text: e["GrandTotal"].toString(),
                                  color: Colors.red,
                                )),
                          );
                        }).toList(),
                      ));
                    } else {
                      return NoData();
                    }
                  } else {
                    return NoData();
                  }
                })
            : widget.Event_Index == 1 && _isLoading == false
                ? Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget.Event_Index = 0;
                                  });
                                },
                                icon: Icon(Icons.arrow_back_ios_new_sharp)),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            BigText(
                              text: ClickedEvent.Eventtitle,
                              color: Colors.white,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.Event_Index = 3;
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Delete Event"),
                                          content: Text(
                                              "Are you sure you want to delete this Event"),
                                          actions: [
                                            TextButton(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                },
                                                child:
                                                    SmallText(text: "Cancel")),
                                            TextButton(
                                                onPressed: () async {
                                                  setState(() {
                                                    _isLoading = true;
                                                  });

                                                  await deleteEvent(
                                                      ClickedEvent.EventId);

                                                  Navigator.pop(context);

                                                  setState(() {
                                                    widget.Event_Index = 0;
                                                    _isLoading = false;
                                                  });
                                                },
                                                child: SmallText(
                                                  text: "Delete",
                                                  color: Colors.red,
                                                )),
                                          ],
                                        );
                                        ;
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Responsive.isDesktop(context)
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context).cardColor,
                                    ),
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        BigText(
                                          text: "${ClickedEvent.GrandTotal}",
                                          color: Colors.white,
                                        ),
                                        SmallText(
                                          text: "Total Summary",
                                          color: const Color.fromARGB(
                                              255, 209, 209, 209),
                                        )
                                      ],
                                    ),
                                  ),
                                  BigText(
                                    text: "=",
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context).cardColor,
                                    ),
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        BigText(
                                          text: "${ClickedEvent.TotalIn}",
                                          color: Colors.white,
                                        ),
                                        SmallText(
                                          text: "Amount In",
                                          color: const Color.fromARGB(
                                              255, 209, 209, 209),
                                        )
                                      ],
                                    ),
                                  ),
                                  BigText(text: "-"),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context).cardColor,
                                    ),
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        BigText(
                                          text: "${ClickedEvent.TotalOut}",
                                          color: Colors.white,
                                        ),
                                        SmallText(
                                          text: "Amount Out",
                                          color: const Color.fromARGB(
                                              255, 209, 209, 209),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context).cardColor,
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        BigText(
                                          text: "${ClickedEvent.GrandTotal}",
                                          color: Colors.white,
                                        ),
                                        SmallText(
                                          text: "Total Summary",
                                          color: const Color.fromARGB(
                                              255, 209, 209, 209),
                                        )
                                      ],
                                    ),
                                  ),

                                  // Container(
                                  //   alignment: Alignment.center,
                                  //   padding: EdgeInsets.all(10),
                                  //   child: BigText(
                                  //     text: "=",
                                  //   ),
                                  // ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context).cardColor,
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        BigText(
                                          text: "${ClickedEvent.TotalIn}",
                                          color: Colors.white,
                                        ),
                                        SmallText(
                                          text: "Amount In",
                                          color: const Color.fromARGB(
                                              255, 209, 209, 209),
                                        )
                                      ],
                                    ),
                                  ),
                                  // Container(
                                  //     alignment: Alignment.center,
                                  //     padding: EdgeInsets.all(10),
                                  //     child: BigText(text: "-")),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context).cardColor,
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        BigText(
                                          text: "${ClickedEvent.TotalOut}",
                                          color: Colors.white,
                                        ),
                                        SmallText(
                                          text: "Amount Out",
                                          color: const Color.fromARGB(
                                              255, 209, 209, 209),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (context, index) => Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 54, 54, 54),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      print("Expanse ${index + 1}");
                                    },
                                    title: BigText(
                                      text: "Expanse ${index + 1}",
                                      color: Colors.white,
                                    ),
                                    subtitle: SmallText(
                                        text:
                                            "This is the reason of Expanse ${index + 1} "),
                                    leading: BigText(
                                      text: "${index + 1}",
                                      color: Colors.white,
                                    ),
                                    trailing: BigText(
                                      text: "100",
                                      color: Colors.green,
                                    ),
                                  ),
                                )),
                      ],
                    ),
                  )
                : AddTransaction(
                    ClickedEvent: ClickedEvent,
                  );
  }
}
