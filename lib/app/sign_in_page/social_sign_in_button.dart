import 'package:flutter/material.dart';

import '../common_widgets/rounded_elevated_button.dart';

class SocialSignInButton extends RoundedElevatedButton {
  final String text;
  final String imagePath;
  final Color textColor;

  SocialSignInButton({
    Key? key,
    required this.text,
    required this.imagePath,
    this.textColor = Colors.black87,
    VoidCallback? onPressed,
  }) : super(
            key: key,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(),
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                Image.asset(imagePath),
              ],
            ),
            onPressed: onPressed);
}
