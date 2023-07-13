import 'package:flutter/material.dart';
import 'package:netflix_project/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          size: 30,
        ),
        kWidth,
        Container(
          color: kButtonColorWhite,
          height: 30,
          width: 30,
        )
      ],
    );
  }
}
