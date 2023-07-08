import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/SmallText.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.error),
          SizedBox(
            height: 20,
          ),
          SmallText(text: "No Data Available")
        ],
      ),
    );
  }
}
