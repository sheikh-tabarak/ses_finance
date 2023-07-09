// ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables, use_build_context_synchronously, unused_field
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ses_finance/configurations/AppColors.dart';
import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/configurations/SmallText.dart';
import 'package:ses_finance/main_page.dart';
import 'package:ses_finance/models/events.dart';
import 'package:ses_finance/models/transaction.dart';
import 'package:ses_finance/pages/events/subpages/add_transaction.dart';
import 'package:ses_finance/pages/loading.dart';
import 'package:ses_finance/widgets/no_data.dart';

class SingleEvent extends StatefulWidget {
  final Event ClickedEvent;

  SingleEvent({super.key, required this.ClickedEvent});

  @override
  State<SingleEvent> createState() => _SingleEventState();
}

class _SingleEventState extends State<SingleEvent> {
  bool _isLoading = false;
  bool _addEvent = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? Loading(
            message: "Deleting Event",
          )
        : _isLoading == false && _addEvent == true
            ? AddTransaction(ClickedEvent: widget.ClickedEvent)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPage(
                                          homePageIndex: 1, eventPageIndex: 0)

                                      //  HomePage(
                                      //       homePageIndex: 0,
                                      //       scaffoldKey: _scaffoldKey,
                                      //     )
                                      ));
                            });
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_sharp)),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      BigText(
                        text: "All transactions",
                        //widget.ClickedEvent.Eventtitle,
                        color: Colors.white,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                setState(() {
                                  _addEvent = true;
                                });
                              });
                            },
                            icon: const Icon(Icons.add),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Delete Event"),
                                    content: const Text(
                                        "Are you sure you want to delete this Event"),
                                    actions: [
                                      TextButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                          child: SmallText(text: "Cancel")),
                                      TextButton(
                                          onPressed: () async {
                                            setState(() {
                                              _isLoading = true;
                                            });

                                            await deleteEvent(
                                                widget.ClickedEvent.EventId);

                                            Navigator.pop(context);

                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MainPage(
                                                          homePageIndex: 1,
                                                          eventPageIndex: 0,
                                                        )));

                                            setState(() {
                                              // widget.Event_Index = 0;
                                              _isLoading = false;
                                            });
                                          },
                                          child: SmallText(
                                            text: "Delete",
                                            color: Colors.red,
                                          )),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: AppColors.PrimaryColor),
                    child: ListTile(
                      title: BigText(text: widget.ClickedEvent.Eventtitle),
                      subtitle:
                          SmallText(text: widget.ClickedEvent.Eventdescription),
                      trailing: Column(
                        children: [
                          Wrap(
                            children: [
                              const Icon(
                                Icons.arrow_upward,
                                color: Colors.green,
                                size: 10,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SmallText(
                                text:
                                    "${widget.ClickedEvent.TotalIn.toString()} | ",
                                size: 10,
                              ),
                              const Icon(
                                Icons.arrow_downward,
                                color: Colors.red,
                                size: 10,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SmallText(
                                text: widget.ClickedEvent.TotalOut.toString(),
                                size: 10,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          BigText(
                            text:
                                "${widget.ClickedEvent.GrandTotal.toString()} PKR",
                          ),
                          //  SmallText(text: "Balance")
                        ],
                      ),
                    ),
                  ),

                  //  SizedBox(
                  //   height: 5,
                  // ),

                  // const SizedBox(
                  //   height: 15,
                  // ),

                  // Responsive.isDesktop(context)
                  //     ? Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           //mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  //           Container(
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(10),
                  //               color: Theme.of(context).cardColor,
                  //             ),
                  //             padding: const EdgeInsets.all(20),
                  //             child: Column(
                  //               children: [
                  //                 BigText(
                  //                   text: "${widget.ClickedEvent.GrandTotal}",
                  //                   color: Colors.white,
                  //                 ),
                  //                 SmallText(
                  //                   text: "Total Summary",
                  //                   color: const Color.fromARGB(
                  //                       255, 209, 209, 209),
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //           BigText(
                  //             text: "=",
                  //           ),
                  //           Container(
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(10),
                  //               color: Theme.of(context).cardColor,
                  //             ),
                  //             padding: const EdgeInsets.all(20),
                  //             child: Column(
                  //               children: [
                  //                 BigText(
                  //                   text: "${widget.ClickedEvent.TotalIn}",
                  //                   color: Colors.white,
                  //                 ),
                  //                 SmallText(
                  //                   text: "Amount In",
                  //                   color: const Color.fromARGB(
                  //                       255, 209, 209, 209),
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //           BigText(text: "-"),
                  //           Container(
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(10),
                  //               color: Theme.of(context).cardColor,
                  //             ),
                  //             padding: const EdgeInsets.all(20),
                  //             child: Column(
                  //               children: [
                  //                 BigText(
                  //                   text: "${widget.ClickedEvent.TotalOut}",
                  //                   color: Colors.white,
                  //                 ),
                  //                 SmallText(
                  //                   text: "Amount Out",
                  //                   color: const Color.fromARGB(
                  //                       255, 209, 209, 209),
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       )
                  //     : Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           //mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  //           Container(
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(10),
                  //               color: Theme.of(context).cardColor,
                  //             ),
                  //             padding: const EdgeInsets.all(10),
                  //             child: Column(
                  //               children: [
                  //                 BigText(
                  //                   text: "${widget.ClickedEvent.GrandTotal}",
                  //                   color: Colors.white,
                  //                 ),
                  //                 SmallText(
                  //                   text: "Total Summary",
                  //                   color: const Color.fromARGB(
                  //                       255, 209, 209, 209),
                  //                 )
                  //               ],
                  //             ),
                  //           ),

                  //           // Container(
                  //           //   alignment: Alignment.center,
                  //           //   padding: EdgeInsets.all(10),
                  //           //   child: BigText(
                  //           //     text: "=",
                  //           //   ),
                  //           // ),
                  //           Container(
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(10),
                  //               color: Theme.of(context).cardColor,
                  //             ),
                  //             padding: const EdgeInsets.all(10),
                  //             child: Column(
                  //               children: [
                  //                 BigText(
                  //                   text: "${widget.ClickedEvent.TotalIn}",
                  //                   color: Colors.white,
                  //                 ),
                  //                 SmallText(
                  //                   text: "Amount In",
                  //                   color: const Color.fromARGB(
                  //                       255, 209, 209, 209),
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //           // Container(
                  //           //     alignment: Alignment.center,
                  //           //     padding: EdgeInsets.all(10),
                  //           //     child: BigText(text: "-")),
                  //           Container(
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(10),
                  //               color: Theme.of(context).cardColor,
                  //             ),
                  //             padding: const EdgeInsets.all(10),
                  //             child: Column(
                  //               children: [
                  //                 BigText(
                  //                   text: "${widget.ClickedEvent.TotalOut}",
                  //                   color: Colors.white,
                  //                 ),
                  //                 SmallText(
                  //                   text: "Amount Out",
                  //                   color: const Color.fromARGB(
                  //                       255, 209, 209, 209),
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),

                  StreamBuilder(
                    stream: AllTransactionofEvent(widget.ClickedEvent.EventId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.docs.isNotEmpty) {
                          return ListView(
                            shrinkWrap: true,
                            children: snapshot.data!.docs.map((e) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 54, 54, 54),
                                ),
                                child: ListTile(
                                  onTap: () {
                                    //    print("Expanse ${index + 1}");
                                  },
                                  title: BigText(
                                    text: e["TransactionMode"] == "Subtract"
                                        ? "Expanse"
                                        : "Income",
                                    color: Colors.white,
                                  ),
                                  subtitle: SmallText(
                                      text: e["TransactionDescription"]),
                                  leading: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SmallText(
                                          text: DateFormat("dd | MMMM").format(
                                              DateTime.parse(
                                                  e["TransactionDate"]
                                                      .toString()))),
                                      BigText(
                                        text: DateFormat("hh:mm").format(
                                            DateTime.parse(e["TransactionDate"]
                                                .toString())),
                                        //size: 8,
                                      ),
                                    ],
                                  ),

                                  // Icon(Icons.event),
                                  trailing: BigText(
                                    text: e["TransactionMode"] == "Subtract"
                                        ? "-${e["TransactionAmount"].toString()}"
                                        : e["TransactionAmount"].toString(),
                                    color: e["TransactionMode"] == "Subtract"
                                        ? Colors.red
                                        : Colors.green,
                                  ),
                                ),
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
                  )
                  // ListView.builder(
                  //     shrinkWrap: true,
                  //     itemCount: 10,
                  //     itemBuilder: (context, index) => Container(
                  //           padding: const EdgeInsets.all(10),
                  //           decoration: const BoxDecoration(
                  //             color: Color.fromARGB(255, 54, 54, 54),
                  //           ),
                  //           child: ListTile(
                  //             onTap: () {
                  //               //    print("Expanse ${index + 1}");
                  //             },
                  //             title: BigText(
                  //               text: "Expanse ${index + 1}",
                  //               color: Colors.white,
                  //             ),
                  //             subtitle: SmallText(
                  //                 text:
                  //                     "This is the reason of Expanse ${index + 1} "),
                  //             leading: BigText(
                  //               text: "${index + 1}",
                  //               color: Colors.white,
                  //             ),
                  //             trailing: BigText(
                  //               text: "100",
                  //               color: Colors.green,
                  //             ),
                  //           ),
                  //         )),
                ],
              );
  }
}
