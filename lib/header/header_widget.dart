import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/const.dart';
import 'package:ses_finance/responsive.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!Responsive.isDesktop(context))
            Padding(
              padding: const EdgeInsets.only(right: 20),
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
          if (!Responsive.isMobile(context))
            //   BigText(text: "A Solution for Finance Managment of SES"),
            // Expanded(
            //   flex: 4,
            //   child: TextField(
            //     decoration: InputDecoration(
            //         filled: true,
            //         fillColor: cardBackgroundColor,
            //         enabledBorder: const OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.transparent),
            //         ),
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(12.0),
            //         ),
            //         focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(12.0),
            //           borderSide:
            //               BorderSide(color: Theme.of(context).primaryColor),
            //         ),
            //         contentPadding: const EdgeInsets.symmetric(
            //           vertical: 5,
            //         ),
            //         hintText: 'Search',
            //         prefixIcon: const Icon(
            //           Icons.search,
            //           color: Colors.grey,
            //           size: 21,
            //         )),
            //   ),
            // ),

            if (Responsive.isMobile(context))
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => scaffoldKey.currentState!.openEndDrawer(),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: //Text("data")
                          Image.asset(
                        "assets/images/avatar.png",
                        width: 32,
                      ),
                    ),
                  )
                ],
              ),
        ],
      ),
    );
  }
}
