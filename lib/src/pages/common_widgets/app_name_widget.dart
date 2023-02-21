import 'package:flutter/material.dart';
import 'package:lojinha/src/config/custom_colors.dart';


class AppNameWidget extends StatelessWidget {

  final Color? greenTitileColor;
  final double textSize;


  const AppNameWidget({
    Key? key,
    this.greenTitileColor,
    this.textSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style:  TextStyle(
          fontSize: textSize,
        ),
        children: [
          TextSpan(
            text: "Sua",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: greenTitileColor ?? CustomColors.customSawtchColor,
            ),
          ),
          TextSpan(
            text: "Loja",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CustomColors.customContrastColor,
            ),
          ),
        ],
      ),
    );
  }
}