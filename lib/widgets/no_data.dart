import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/configurations/SmallText.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.error),
          const SizedBox(
            height: 20,
          ),
          BigText(text: "No Data Available"),
          const SizedBox(
            height: 7,
          ),
          SmallText(
              text:
                  "Either you are not connected to internet or the required data is empty")
        ],
      ),
    );
  }
}
