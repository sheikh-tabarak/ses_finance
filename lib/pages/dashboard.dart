// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/configurations/SmallText.dart';
import 'package:ses_finance/const.dart';
import 'package:ses_finance/models/events.dart';
import 'package:ses_finance/models/transaction.dart';
import 'package:ses_finance/widgets/no_data.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // List<String> _EventName = [];
  double _TIn = 0;
  double _TOut = 0;
  double _GT = 0;

  // Future _getEventName(id) async {
  //   await FirebaseFirestore.instance
  //       .collection("user")
  //       .doc("SESSION_2022_23")
  //       .collection("events")
  //       .doc(id)
  //       .get()
  //       .then((value) {
  //     _EventName.add(value["Eventtitle"]);
  //     //  _EventName = value["Eventtitle"];
  //     // print();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //  Scaffold(
    //   body:
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
          stream: AllEventsData(),
          builder: (context, snapshot) {
            // for (var i = 0; i < snapshot.data!.docs.length; i++) {

            // }

            if (snapshot.hasData) {
              if (snapshot.data!.docs.isNotEmpty) {
                for (var e in snapshot.data!.docs) {
                  _GT = _GT + e["GrandTotal"];
                  _TIn = _TIn + e["TotalIn"];
                  _TOut = _TOut + e["TotalOut"];
                }
                return Wrap(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        color: cardBackgroundColor,
                      ),
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.attach_money_sharp,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BigText(
                            text: "$_GT PKR",
                            color: Colors.white,
                          ),
                          SmallText(
                            text: "Balance",
                            color: const Color.fromARGB(255, 209, 209, 209),
                          )
                        ],
                      ),
                      //  ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                        color: cardBackgroundColor,
                      ),
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.arrow_upward,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BigText(
                            text: "$_TIn PKR",
                            color: Colors.white,
                          ),
                          SmallText(
                            text: "Total Incoming",
                            color: const Color.fromARGB(255, 209, 209, 209),
                          )
                        ],
                      ),
                      //  ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),

                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                        color: cardBackgroundColor,
                      ),
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          const Icon(Icons.arrow_downward),
                          const SizedBox(
                            height: 10,
                          ),
                          BigText(
                            text: "$_TOut PKR",
                            color: Colors.white,
                          ),
                          SmallText(
                            text: "Total Expanse",
                            color: const Color.fromARGB(255, 209, 209, 209),
                          )
                        ],
                      ),
                      //  ),
                    ),
                  ],
                );
              } else {
                return const NoData();
              }
            } else {
              return const NoData();
            }
          },
        ),
        BigText(text: "Recent Transactions"),
        const SizedBox(
          height: 15,
        ),
        Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SmallText(text: "Date - Time : "),
                    // Icon(
                    //   Icons.circle,
                    //   color:
                    //       const Color.fromARGB(255, 255, 255, 255),
                    // ),
                    const SizedBox(
                      width: 10,
                    ),
                    SmallText(text: "Event Details"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [SmallText(text: "Amount")],
                ),
              ],
            )),
        StreamBuilder(
          stream: All_Transactions(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.docs.isNotEmpty) {
                // snapshot.data!.docs.forEach((e) async {
                //   String EventName = "";
                // await FirebaseFirestore.instance
                //     .collection("user")
                //     .doc("SESSION_2022_23")
                //     .collection("events")
                //     .doc(e["EventId"])
                //     .get()
                //     .then((value) {

                //   print(value["Eventtitle"]);
                // });

                // //  _EventName = EventName;
                // });
                return ListView(
                  shrinkWrap: true,
                  children: snapshot.data!.docs.map((e) {
                    //   _getEventName(e["EventId"]);
                    // _Event_Name = "";
                    // print("this: $_EventName");

                    return Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 54, 54, 54),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SmallText(
                                    text: DateFormat("dd | MMMM - hh:mm :")
                                        .format(DateTime.parse(
                                            e["TransactionDate"].toString()))),
                                // Icon(
                                //   Icons.circle,
                                //   color:
                                //       const Color.fromARGB(255, 255, 255, 255),
                                // ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SmallText(
                                    text:
                                        "${e["TransactionMode"] == "Subtract" ? "Decrement" : "Increment"} in SES"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SmallText(
                                  text: e["TransactionAmount"].toString(),
                                  color: e["TransactionMode"] == "Subtract"
                                      ? Colors.red
                                      : Colors.green,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                e["TransactionMode"] == "Subtract"
                                    ? const Icon(
                                        Icons.arrow_downward,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.arrow_upward,
                                        color: Colors.green,
                                      )
                              ],
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     SmallText(
                            //       text: e["TransactionMode"] == "Add"
                            //           ? e["TransactionAmount"].toString()
                            //           : "-",
                            //       color: e["TransactionMode"] == "Add"
                            //           ? Colors.green
                            //           : Colors.grey,
                            //     ),
                            //     SizedBox(
                            //       width: 2,
                            //     ),
                            //     e["TransactionMode"] == "Add"
                            //         ? Icon(
                            //             Icons.arrow_upward,
                            //             color: Colors.green,
                            //           )
                            //         : SizedBox()
                            //   ],
                            // ),
                          ],
                        )
                        // ListTile(
                        //   onTap: () {
                        //     //    print("Expanse ${index + 1}");
                        //   },
                        //   title: BigText(
                        //     text: e["TransactionMode"] == "Subtract"
                        //         ? "Expanse"
                        //         : "Income",
                        //     color: Colors.white,
                        //   ),
                        //   subtitle: SmallText(text: e["TransactionDescription"]),
                        //   leading: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       SmallText(
                        //           text: DateFormat("dd | MMMM").format(
                        //               DateTime.parse(
                        //                   e["TransactionDate"].toString()))),
                        //       BigText(
                        //         text: DateFormat("hh:mm").format(DateTime.parse(
                        //             e["TransactionDate"].toString())),
                        //         //size: 8,
                        //       ),
                        //     ],
                        //   ),

                        //   // Icon(Icons.event),
                        //   trailing: BigText(
                        //     text: e["TransactionMode"] == "Subtract"
                        //         ? "-${e["TransactionAmount"].toString()}"
                        //         : e["TransactionAmount"].toString(),
                        //     color: e["TransactionMode"] == "Subtract"
                        //         ? Colors.red
                        //         : Colors.green,
                        //   ),
                        // ),

                        );
                  }).toList(),
                );
              } else {
                return const NoData();
              }
            } else {
              return const NoData();
            }
          },
        ),
      ],
    );
    //  );
  }
}
