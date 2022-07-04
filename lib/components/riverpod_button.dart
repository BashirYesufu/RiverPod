import 'package:flutter/material.dart';

class RiverPodButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final double height;
  final Widget? child;
  final double borderWidth;

  const RiverPodButton({
    required this.onPressed,
    this.text = '',
    this.textColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.borderColor = Colors.blue,
    this.child,
    this.height = 50.0,
    this.borderWidth = 0.5,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Material(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: borderColor,
              width: borderWidth,
            )
        ),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: double.infinity,
          height: height,
          child: child ?? Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
