import 'package:flutter/material.dart';
import 'package:netflix_project/core/constants.dart';
import 'package:netflix_project/presentation/widgets/main_card.dart';
import 'package:netflix_project/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(
            title: title,
          ),
          kHight10,
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => const MainCardWidget(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
