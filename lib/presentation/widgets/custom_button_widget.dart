import 'package:flutter/material.dart';

class CoustomButtonWidget extends StatelessWidget {
  const CoustomButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    this.iconSize = 30,
    this.textSize = 18,
    this.fontWeight = FontWeight.bold,
  });

  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
