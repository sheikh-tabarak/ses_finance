// ignore_for_file: must_be_immutable, non_constant_identifier_names, library_private_types_in_public_api, void_checks, use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/configurations/SmallText.dart';
import 'package:ses_finance/const.dart';
import 'package:ses_finance/models/user.dart';
import 'package:ses_finance/pages/login.dart';
import 'package:ses_finance/responsive.dart';

class Menu extends StatefulWidget {
  Function TapAction;
  final GlobalKey<ScaffoldState> scaffoldKey;

  Menu({
    Key? key,
    required this.TapAction(int PageIndex),
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selected = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.grey[800]!,
              width: 1,
            ),
          ),
          color: const Color(0xFF171821)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: const BoxDecoration(color: cardBackgroundColor),
              padding: EdgeInsets.only(
                  top: Responsive.isMobile(context) ? 20 : 30,
                  bottom: Responsive.isMobile(context) ? 20 : 30),
              child: BigText(
                text: "Menu",
                color: Colors.white,
                size: 20,
              ),
            ),
            // SizedBox(
            //   height: Responsive.isMobile(context) ? 10 : 20,
            // ),

            // SizedBox(
            //   height: Responsive.isMobile(context) ? 20 : 40,
            // ),
            //),
            ListTile(
              onTap: () {
                setState(() {
                  selected = 0;
                  return widget.TapAction(selected);
                });
              },
              leading: const Icon(Icons.dashboard),
              title: SmallText(
                text: "Dashboard",
                color: Colors.white,
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  selected = 1;
                  return widget.TapAction(selected);
                });
              },
              leading: const Icon(Icons.calendar_month),
              title: SmallText(
                text: "All Events",
                color: Colors.white,
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  selected = 2;
                  return widget.TapAction(selected);
                });
              },
              leading: const Icon(Icons.add),
              title: SmallText(
                text: "Create Event",
                color: Colors.white,
              ),
            ),

            ListTile(
              onTap: () {
                setState(() {
                  selected = 3;
                  return widget.TapAction(selected);
                });
              },
              leading: const Icon(Icons.notes),
              title: SmallText(
                text: "Notes",
                color: Colors.white,
              ),
            ),
            ListTile(
              onTap: () async {
                await signout();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              leading: const Icon(Icons.logout),
              title: SmallText(
                text: "Logout",
                color: Colors.white,
              ),
            )
          ],
        )),
      ),
    );
  }
}
