// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/AppColors.dart';
import 'package:ses_finance/configurations/Dimensions.dart';
import 'package:ses_finance/configurations/SmallText.dart';

class PrimaryButton extends StatelessWidget {
  bool isLoading;
  final Function TapAction;
  final String text;
  final Color color;
  final IconData icon;
  final double ButtonRadius;
  bool isExpanded;

//  final double marginValue;
  double padding;

  PrimaryButton(
      {super.key,
      this.isLoading = false,
      required this.TapAction,
      required this.text,
      required this.color,
      required this.icon,
      this.ButtonRadius = 10,
      //  this.marginValue = 12,
      this.padding = 12,
      this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => isLoading ? () {} : TapAction(),
      child: Container(
        width: isExpanded == false ? 300 : double.infinity,
        //    height:double.nan,

        alignment: Alignment.center,
        // padding: const EdgeInsets.all(10),
        //  margin: EdgeInsets.all(marginValue),
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(ButtonRadius),
        ),
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: Dimensions.height10,
                  ),
                  SmallText(
                    text: text,
                    color: AppColors.textColor,
                  ),
                ],
              ),
      ),
    );
  }
}
