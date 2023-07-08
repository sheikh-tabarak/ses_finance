import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/SmallText.dart';
import 'package:ses_finance/const.dart';

class PrimaryInputField extends StatelessWidget {
  final String placeholderText;
  final IconData PrefixIcon;
  final bool isPassword;
  final String ErrorMessage;
  final TextEditingController TextEditControl;
  final Function onChange;

  PrimaryInputField(
      {super.key,
      required this.placeholderText,
      required this.PrefixIcon,
      required this.isPassword,
      required this.ErrorMessage,
      required this.TextEditControl,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (value) => onChange(),
            // onChanged: (value) => onChange,
            controller: TextEditControl,
            obscureText: isPassword == true ? true : false,
            decoration: InputDecoration(
                filled: true,
                fillColor: cardBackgroundColor,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          ErrorMessage == "" ? Colors.transparent : Colors.red),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                      color: ErrorMessage == ""
                          ? Theme.of(context).primaryColor
                          : Colors.red
                      //Theme.of(context).primaryColor
                      ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                hintText: placeholderText,
                prefixIcon: Icon(
                  PrefixIcon,
                  color: Colors.grey,
                  size: 21,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SmallText(
              iscentre: false,
              text: ErrorMessage,
              color: Colors.red,
              size: 10,
            ),
          )
        ],
      ),
    );
  }
}
