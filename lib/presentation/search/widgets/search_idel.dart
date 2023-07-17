import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_project/application/movie_data/movie_data.dart';
import 'package:netflix_project/core/colors.dart/colors.dart';
import 'package:netflix_project/core/constants.dart';

import 'package:netflix_project/presentation/search/widgets/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/foGkPxpw9h8zln81j63mix5B7m8.jpg';

class SearchIdelWidget extends StatelessWidget {
  const SearchIdelWidget({super.key, required this.movilist});

  final List<MovieData> movilist;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchWidgetTitle(title: 'Top Search'),
        kHight10,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: movilist.length,
            itemBuilder: (ctx, index) => TopSearchItemTaile(
                moviename: movilist[index].title!,
                posterurl:
                    'https://image.tmdb.org/t/p/w500${movilist[index].backdropPath}'),
            separatorBuilder: (ctx, index) => kHight,
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTaile extends StatelessWidget {
  const TopSearchItemTaile(
      {super.key, required this.moviename, required this.posterurl});

  final String moviename;

  final String posterurl;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.36,
          height: 80,
          margin: const EdgeInsets.only(bottom: 7),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(posterurl), fit: BoxFit.cover),
          ),
        ),
        kWidth,
        Expanded(
          child: Text(
            moviename,
            style: const TextStyle(
                color: kWhite, fontWeight: FontWeight.bold, fontSize: 12),
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
