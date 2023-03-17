import 'package:flutter/material.dart';

import '../common_widgets/rounded_elevated_button.dart';

class SignInButton extends RoundedElevatedButton {
  final String text;
  final Color textColor;

  SignInButton({
    Key? key,
    required this.text,
    this.textColor = Colors.black87,
    VoidCallback? onPressed,
  }) : super(
            key: key,
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
              ),
            ),
            onPressed: onPressed);
}
