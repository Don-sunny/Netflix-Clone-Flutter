import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_project/core/colors.dart/colors.dart';
import 'package:netflix_project/core/constants.dart';
import 'package:netflix_project/presentation/search/widgets/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/foGkPxpw9h8zln81j63mix5B7m8.jpg';

class SearchIdelWidget extends StatelessWidget {
  const SearchIdelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchWidgetTitle(title: 'Top Search'),
        kHight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) => const TopSearchItemTaile(),
            separatorBuilder: (ctx, index) => kHight,
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTaile extends StatelessWidget {
  const TopSearchItemTaile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.36,
          height: 80,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
        kWidth,
        const Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
                color: kWhite, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kWhite,
          radius: 22,
          child: CircleAvatar(
            radius: 21,
            backgroundColor: kBlack,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kWhite,
            ),
          ),
        )
      ],
    );
  }
}
