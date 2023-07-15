import 'package:flutter/material.dart';

class CoustomButtonWidget extends StatelessWidget {
  const CoustomButtonWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}