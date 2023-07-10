// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/configurations/SmallText.dart';
import 'package:ses_finance/const.dart';
import 'package:ses_finance/models/events.dart';
import 'package:ses_finance/models/transaction.dart';
import 'package:ses_finance/responsive.dart';
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
                      padding: Responsive.isDesktop(context)
                          ? const EdgeInsets.all(40)
                          : const EdgeInsets.all(15),
                      margin: Responsive.isDesktop(context)
                          ? const EdgeInsets.all(15)
                          : const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        color: cardBackgroundColor,
                      ),

                      child: Column(
                        children: [
                          Icon(
                            size: Responsive.isDesktop(context) ? 18 : 12,
                            Icons.attach_money_sharp,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BigText(
                            size: Responsive.isDesktop(context) ? 18 : 13,
                            text: "$_GT PKR",
                            color: Colors.white,
                          ),
                          SmallText(
                            size: Responsive.isDesktop(context) ? 12 : 10,
                            text: "Balance",
                            color: const Color.fromARGB(255, 209, 209, 209),
                          )
                        ],
                      ),
                      //  ),
                    ),
                    Container(
                      padding: Responsive.isDesktop(context)
                          ? const EdgeInsets.all(40)
                          : const EdgeInsets.all(15),
                      margin: Responsive.isDesktop(context)
                          ? const EdgeInsets.all(15)
                          : const EdgeInsets.all(5),

                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                        color: cardBackgroundColor,
                      ),

                      child: Column(
                        children: [
                          Icon(
                            size: Responsive.isDesktop(context) ? 18 : 12,
                            Icons.arrow_upward,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BigText(
                            size: Responsive.isDesktop(context) ? 18 : 13,
                            text: "$_TIn PKR",
                            color: Colors.white,
                          ),
                          SmallText(
                            size: Responsive.isDesktop(context) ? 12 : 10,
                            text: "Total Incoming",
                            color: const Color.fromARGB(255, 209, 209, 209),
                          )
                        ],
                      ),
                      //  ),
                    ),
                    Container(
                      padding: Responsive.isDesktop(context)
                          ? const EdgeInsets.all(40)
                          : const EdgeInsets.all(15),
                      margin: Responsive.isDesktop(context)
                          ? const EdgeInsets.all(15)
                          : const EdgeInsets.all(5),

                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                        color: cardBackgroundColor,
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.arrow_downward,
                            size: Responsive.isDesktop(context) ? 18 : 12,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BigText(
                            size: Responsive.isDesktop(context) ? 18 : 13,
                            text: "$_TOut PKR",
                            color: Colors.white,
                          ),
                          SmallText(
                            size: Responsive.isDesktop(context) ? 12 : 10,
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
        const SizedBox(
          height: 10,
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
                return ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: snapshot.data!.docs.map((e) {
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
                          ],
                        ));
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
