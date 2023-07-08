import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/SmallText.dart';

class MessageBar extends StatelessWidget {
  final String message;
  final int message_type;

  MessageBar({super.key, required this.message, required this.message_type});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: message_type == 0
              ? Colors.green
              : message_type == 1
                  ? Colors.red
                  : message_type == 2
                      ? Color.fromARGB(255, 208, 187, 0)
                      : Colors.blue),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(message_type == 0
              ? Icons.check_circle
              : message_type == 1
                  ? Icons.cancel
                  : message_type == 2
                      ? Icons.warning
                      : Icons.square),
          SizedBox(
            width: 20,
          ),
          SmallText(text: message)
        ],
      ),
    );
  }
}
