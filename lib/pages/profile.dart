import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/configurations/SmallText.dart';
import 'package:ses_finance/const.dart';
import 'package:ses_finance/responsive.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Responsive.isMobile(context) ? 10 : 30.0),
          topLeft: Radius.circular(Responsive.isMobile(context) ? 10 : 30.0),
        ),
        color: cardBackgroundColor,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),

              BigText(
                text: "Hierarchy Details",
                color: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/hierarchy.jpg",
              ),
              const SizedBox(
                height: 20,
              ),
              SmallText(
                text: "Coordinator: ",
                size: 12,
                color: Theme.of(context).primaryColor,
              ),
              BigText(
                text: "Mr. Adeel Shehzad",
                color: Colors.white,
              ),
              SizedBox(
                height: 2,
              ),

              const SizedBox(
                height: 15,
              ),
              SmallText(
                text: "President: ",
                size: 12,
                color: Theme.of(context).primaryColor,
              ),
              BigText(
                text: "Hamza Naveed",
                color: Colors.white,
              ),
              SizedBox(
                height: 2,
              ),

              const SizedBox(
                height: 15,
              ),
              SmallText(
                text: "Finance Secratory: ",
                size: 12,
                color: Theme.of(context).primaryColor,
              ),
              BigText(
                text: "Muhammad Tabarak",
                color: Colors.white,
              ),
              SizedBox(
                height: 2,
              ),

              // Text(
              //   "Mr. Adeel Shehzad",
              //   style: TextStyle(),
              // ),

              SizedBox(
                height: Responsive.isMobile(context) ? 20 : 40,
              ),
              //   Scheduled()
            ],
          ),
        ),
      ),
    );
  }
}
