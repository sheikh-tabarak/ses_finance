import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/header/header_widget.dart';
import 'package:ses_finance/pages/events/add_event.dart';
import 'package:ses_finance/pages/events/all_events.dart';
import 'package:ses_finance/pages/dashboard.dart';
import 'package:ses_finance/pages/events/single_event.dart';
import 'package:ses_finance/pages/notes.dart';
import 'package:ses_finance/responsive.dart';

class HomePage extends StatefulWidget {
  int PageIndex;
  final GlobalKey<ScaffoldState> scaffoldKey;

  HomePage({super.key, required this.scaffoldKey, this.PageIndex = 0});

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
                padding: EdgeInsets.all(20),
                child: widget.PageIndex == 0
                    ? Dashboard()
                    : widget.PageIndex == 1
                        ? AllEvents(
                            Event_Index: 0,
                          )
                        // : widget.PageIndex == 11
                        //     ? SingleEvent()
                        : widget.PageIndex == 3
                            ? Notes()
                            : AddEvent(),
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
