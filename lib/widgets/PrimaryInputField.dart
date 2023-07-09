// ignore_for_file: must_be_immutable, non_constant_identifier_names, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ses_finance/configurations/SmallText.dart';
import 'package:ses_finance/const.dart';

class PrimaryInputField extends StatelessWidget {
  final String placeholderText;
  final IconData PrefixIcon;
  final bool isPassword;
  final String ErrorMessage;
  final TextEditingController TextEditControl;
  final Function onChange;
  bool isExpanded;
  bool isOnlyNumbers;
  bool isDisable;

  PrimaryInputField(
      {super.key,
      required this.placeholderText,
      required this.PrefixIcon,
      required this.isPassword,
      required this.ErrorMessage,
      required this.TextEditControl,
      required this.onChange,
      this.isExpanded = false,
      this.isDisable = false,
      this.isOnlyNumbers = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExpanded == false ? 300 : double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            keyboardType:
                isOnlyNumbers ? TextInputType.number : TextInputType.text,
            inputFormatters: isOnlyNumbers
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.digitsOnly
                  ]
                : [],
            enabled: isDisable == true ? false : true,
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
