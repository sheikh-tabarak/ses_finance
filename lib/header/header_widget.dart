import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/configurations/SmallText.dart';
import 'package:ses_finance/main_page.dart';
import 'package:ses_finance/responsive.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: Responsive.isMobile(context) ? 60 : 60,
        child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //   if (!Responsive.isMobile(context))
            InkWell(
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainPage(
                            homePageIndex: 0,
                            eventPageIndex: 0,
                          )
                      //   Dashboard()
                      )),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage('assets/images/avatar.png'),
                        width: 40,
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          //   isCentre: false,
                          //  isCentre: true,
                          text: "Software Engineering Society",
                          size: Responsive.isMobile(context) ? 14 : 20,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SmallText(
                          //     iscentre: false,
                          //  iscentre: true,
                          text: "Arfa Kareem Block, university of Gujrat",
                          size: Responsive.isMobile(context) ? 11 : 15,
                          color: const Color.fromARGB(255, 202, 202, 202),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            if (!Responsive.isDesktop(context))
              Padding(
                padding: const EdgeInsets.all(0),
                child: InkWell(
                  onTap: () => scaffoldKey.currentState!.openDrawer(),
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Icon(
                      Icons.menu,
                      color: Colors.grey,
                      size: 25,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
