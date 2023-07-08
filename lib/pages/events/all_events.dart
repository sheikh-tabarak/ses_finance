import 'package:flutter/material.dart';

import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/configurations/SmallText.dart';
import 'package:ses_finance/models/events.dart';
import 'package:ses_finance/pages/events/subpages/add_transaction.dart';
import 'package:ses_finance/responsive.dart';

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
  Event ClickedEvent = Event(
      StartDate: "",
      Eventtitle: "",
      Eventdescription: "",
      TotalIn: 0,
      TotalOut: 0,
      GrandTotal: 0);

  @override
  Widget build(BuildContext context) {
    return widget.Event_Index == 0
        ? Container(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 54, 54, 54),
                      ),
                      child: ListTile(
                          onTap: () {
                            print("Event ${index + 1}");
                            setState(() {
                              widget.Event_Index = 1;
                              ClickedEvent = Event(
                                  StartDate: DateTime.now().toString(),
                                  Eventtitle: "Event ${index + 1}",
                                  Eventdescription:
                                      "Event Descrition ${index + 1}",
                                  TotalIn: 50,
                                  TotalOut: 20,
                                  GrandTotal: 30);
                            });
                          },
                          title: BigText(
                            text: "Event ${index + 1}",
                            color: Colors.white,
                          ),
                          leading: Icon(Icons.arrow_forward_ios),
                          //Icon(Icons.event),
                          trailing: BigText(
                            text: "-1000",
                            color: Colors.red,
                          )
                          // Row(
                          //   children: [
                          //     BigText(
                          //       text: "600",
                          //       color: Colors.red,
                          //     ),
                          //     SizedBox(
                          //       width: 10,
                          //     ),

                          //    ],
                          //  ),
                          ),
                    )),
          )
        : widget.Event_Index == 1
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
                        IconButton(
                            onPressed: () {
                              setState(() {
                                widget.Event_Index = 3;
                              });
                            },
                            icon: Row(
                              children: [
                                Icon(Icons.add),
                                // SizedBox(
                                //   width: 5,
                                // ),
                                // BigText(text: "Add Transaction")
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Responsive.isDesktop(context)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
