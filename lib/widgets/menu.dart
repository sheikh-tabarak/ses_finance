import 'package:flutter/material.dart';

import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/configurations/SmallText.dart';
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
    // TODO: implement initState

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
            SizedBox(
              height: Responsive.isMobile(context) ? 20 : 40,
            ),
            // CircleAvatar(
            //     radius: 30,
            //     //  backgroundColor: Colors.white,
            //     child:

            Row(
              children: [
                Image(
                  image: AssetImage('assets/images/avatar.png'),
                  width: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        //   isCentre: false,
                        text: "Software Engineering Society",
                        size: 12,
                        color: Colors.white,
                      ),
                      SmallText(
                        //     iscentre: false,
                        text: "Arfa Kareem Block, university of Gujrat",
                        size: 10,
                        color: const Color.fromARGB(255, 202, 202, 202),
                      )
                    ],
                  ),
                )
              ],
            ),

            SizedBox(
              height: Responsive.isMobile(context) ? 20 : 40,
            ),
            //),
            ListTile(
              onTap: () {
                setState(() {
                  selected = 0;
                  return widget.TapAction(selected);
                });
              },
              leading: Icon(Icons.dashboard),
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
              leading: Icon(Icons.calendar_month),
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
              leading: Icon(Icons.add),
              title: SmallText(
                text: "Create Event",
                color: Colors.white,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              leading: Icon(Icons.logout),
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
