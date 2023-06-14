import 'package:flutter/material.dart';

class ElevetedButtonWidget extends StatelessWidget {
  const ElevetedButtonWidget(
      {super.key,
      required this.buttonName,
      required this.width,
      required this.height,
      required this.onTap,
      required this.buttonColor});
  final String buttonName;
  final double width;
  final double height;
  final VoidCallback onTap;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5),
        ),
        width: width,
        height: height,
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
