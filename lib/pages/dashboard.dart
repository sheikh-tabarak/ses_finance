import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/configurations/SmallText.dart';
import 'package:ses_finance/const.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    //  Scaffold(
    //   body:
    return Wrap(
      children: [
        Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cardBackgroundColor,
          ),
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Icon(Icons.attach_money_outlined),
              SizedBox(
                height: 10,
              ),
              BigText(
                text: "2500 PKR",
                color: Colors.white,
              ),
              SmallText(
                text: "Balance",
                color: const Color.fromARGB(255, 209, 209, 209),
              )
            ],
          ),
          //  ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cardBackgroundColor,
          ),
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Icon(Icons.currency_exchange_sharp),
              SizedBox(
                height: 10,
              ),
              BigText(
                text: "1000 PKR",
                color: Colors.white,
              ),
              SmallText(
                text: "Cash Available",
                color: const Color.fromARGB(255, 209, 209, 209),
              )
            ],
          ),
          //  ),
        ),
        Container(
          margin: EdgeInsets.all(15),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cardBackgroundColor,
          ),
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Icon(Icons.install_mobile_outlined),
              SizedBox(
                height: 10,
              ),
              BigText(
                text: "1500 PKR",
                color: Colors.white,
              ),
              SmallText(
                text: "In Account",
                color: const Color.fromARGB(255, 209, 209, 209),
              )
            ],
          ),
          //  ),
        ),
      ],
    );
    //  );
  }
}
