// ignore_for_file: must_be_immutable, non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:ses_finance/header/header_widget.dart';
import 'package:ses_finance/pages/events/add_event.dart';
import 'package:ses_finance/pages/events/all_events.dart';
import 'package:ses_finance/pages/dashboard.dart';
import 'package:ses_finance/pages/notes.dart';
import 'package:ses_finance/responsive.dart';

class HomePage extends StatefulWidget {
  int homePageIndex;
  int eventPageIndex;

  final GlobalKey<ScaffoldState> scaffoldKey;

  HomePage(
      {super.key,
      required this.scaffoldKey,
      required this.homePageIndex,
      required this.eventPageIndex});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizedBox _height(BuildContext context) => SizedBox(
          height: Responsive.isDesktop(context) ? 30 : 20,
        );

    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 15 : 18),
          child: Column(
            children: [
              SizedBox(
                height: Responsive.isMobile(context) ? 5 : 18,
              ),
              Header(scaffoldKey: widget.scaffoldKey),

              Padding(
                padding: const EdgeInsets.all(20),
                child: widget.homePageIndex == 0
                    ? const Dashboard()
                    : widget.homePageIndex == 1
                        ? AllEvents(
                            Event_Index: widget.eventPageIndex,
                          )
                        // : widget.PageIndex == 11
                        //     ? SingleEvent()
                        : widget.homePageIndex == 3
                            ? const Notes()
                            : const AddEvent(),
              ),

              _height(context),
              // const ActivityDetailsCard(),
              _height(context),
              //   LineChartCard(),
              _height(context),
              //   BarGraphCard(),
              _height(context),
            ],
          ),
        )));
  }
}
