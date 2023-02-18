import 'package:flutter/material.dart';
import 'package:lojinha/src/config/custom_colors.dart';


class AppNameWidget extends StatelessWidget {
  const AppNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: const TextStyle(
          fontSize: 30,
        ),
        children: [
          TextSpan(
            text: "Sua",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CustomColors.customSawtchColor,
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