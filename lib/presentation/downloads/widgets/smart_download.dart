import 'package:flutter/material.dart';
import 'package:netflix_project/core/colors.dart/colors.dart';

class SmartDownload extends StatelessWidget {
  const SmartDownload({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kWhite,
        ),
        Text('Smart downloads'),
      ],
    );
  }
}
