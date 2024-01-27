import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_project/application/bloc/search_bloc.dart';
import 'package:netflix_project/application/movie_data/movie_data.dart';
import 'package:netflix_project/core/constants.dart';
import 'package:netflix_project/main.dart';
import 'package:netflix_project/presentation/search/widgets/search_idel.dart';
import 'package:netflix_project/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  List<MovieData> movielist = [];
  TextEditingController searchcontroller = TextEditingController();

  @override
  void initState() {
    movielist = trendingmovies;
    super.initState();
  }

  void search(String moviname) {
    List<MovieData> result = [];
    if (moviname.isEmpty) {
      result = trendingmovies;
    } else {
      result = trendingmovies
          .where((element) =>
              element.title!.toLowerCase().contains(moviname.toLowerCase()))
          .toList();
    }
    setState(() {
      movielist = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            controller: searchcontroller,
            onChanged: (value) {
              BlocProvider.of<SearchBloc>(context)
                  .add(SearchMovie(movieQuery: value));
            },
            backgroundColor: Colors.grey.withOpacity(0.4),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey,
            ),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          kHight,
          Expanded(child: //searchcontroller.text.isEmpty
                  BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isError) {
                return const Center(
                  child: Text('An error occuered'),
                );
              }
              if (state.searchResultList.isEmpty ||
                  searchcontroller.text.isEmpty) {
                return const SearchIdelWidget();
              } else {
                return const SearchResultsWidget();
              }
            },
          )
              // SearchResultsWidget(movielist: trendingmovies),
              ),
        ],
      ),
    )));
  }
}
