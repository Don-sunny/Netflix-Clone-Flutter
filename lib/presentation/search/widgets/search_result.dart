import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_project/application/bloc/search_bloc.dart';
import 'package:netflix_project/application/movie_data/movie_data.dart';
import 'package:netflix_project/main.dart';

import 'package:netflix_project/presentation/search/widgets/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/dalsmJZErwS1oqDJoSi85sxdxMX.jpg';

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchWidgetTitle(title: 'Movies & TV'),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1 / 1.4,
                children: List.generate(state.searchResultList.length, (index) {
                  final movie = state.searchResultList[index];
                  return MainCard(
                    posterurl:
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  );
                }),
              );
            },
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.posterurl});
  final String posterurl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(posterurl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
