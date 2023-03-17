import 'package:flutter/material.dart';

class RoundedElevatedButton extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final double height;

  const RoundedElevatedButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.borderRadius = 5.0,
    this.height = 50.0,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 4.0,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
