import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/configurations/SmallText.dart';

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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 73, 73, 73),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(Icons.currency_exchange),
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
        )
      ],
    );
    //  );
  }
}
