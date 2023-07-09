// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/SmallText.dart';

class Loading extends StatefulWidget {
  String message;
  Loading({
    Key? key,
    this.message = "Loading...",
  }) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 10,
          ),
          const SizedBox(
            height: 20,
          ),
          SmallText(text: widget.message)
        ],
      ),
    ));
  }
}
