import 'package:flutter/material.dart';
import 'package:ses_finance/pages/home_page.dart';
import 'package:ses_finance/pages/profile.dart';
import 'package:ses_finance/responsive.dart';
import 'package:ses_finance/widgets/menu.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pageIndex = 0;
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
                      _pageIndex = value;
                    });
                    Navigator.pop(context);
                    print("Page index $value");
                  },
                ))
            : null,
        endDrawer: Responsive.isMobile(context)
            ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text("This is profile space"))
            : null,
        body: SafeArea(
          child: Row(
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 3,
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Menu(
                          TapAction: (value) {
                            setState(() {
                              _pageIndex = value;
                            });

                            print("Page index $value");
                          },
                          scaffoldKey: _scaffoldKey)),
                ),
              Expanded(
                  flex: 8,
                  child: HomePage(
                      PageIndex: _pageIndex, scaffoldKey: _scaffoldKey)),
              if (!Responsive.isMobile(context))
                Expanded(
                  flex: 4,
                  child: Profile(),
                ),
            ],
          ),
        ));
  }
}
