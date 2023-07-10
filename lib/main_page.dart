// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:ses_finance/pages/home_page.dart';
import 'package:ses_finance/pages/profile.dart';
import 'package:ses_finance/responsive.dart';
import 'package:ses_finance/widgets/menu.dart';

class MainPage extends StatefulWidget {
  int homePageIndex;
  int eventPageIndex;
  MainPage(
      {super.key, required this.homePageIndex, required this.eventPageIndex});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: !Responsive.isDesktop(context)
            ? SizedBox(
                width: 250,
                child: Menu(
                  scaffoldKey: _scaffoldKey,
                  TapAction: (value) {
                    setState(() {
                      widget.homePageIndex = value;
                    });
                    Navigator.pop(context);
                    //   print("Page index $value");
                  },
                ))
            : null,
        endDrawer: Responsive.isMobile(context) ? const Profile() : null,
        body: SafeArea(
          child: Column(
            //   alignment: Alignment.bottomCenter,
            children: [
              Row(
                children: [
                  if (Responsive.isDesktop(context))
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Menu(
                              TapAction: (value) {
                                setState(() {
                                  widget.homePageIndex = value;
                                  if (value == 1) {
                                    widget.eventPageIndex = 0;
                                  }
                                });

                                //     print("Page index $value");
                              },
                              scaffoldKey: _scaffoldKey)),
                    ),
                  Expanded(
                      flex: 8,
                      child: HomePage(
                          homePageIndex: widget.homePageIndex,
                          eventPageIndex: widget.eventPageIndex,
                          scaffoldKey: _scaffoldKey)),
                  if (!Responsive.isMobile(context))
                    const Expanded(
                      flex: 4,
                      child: Profile(),
                    ),
                ],
              ),
            ],
          ),
        ));
  }
}
