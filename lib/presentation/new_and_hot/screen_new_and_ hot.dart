import 'package:flutter/material.dart';
import 'package:netflix_project/application/movie_data/api_functions.dart';
import 'package:netflix_project/application/upcomming_movies/api%20functions.dart';
import 'package:netflix_project/core/colors.dart/colors.dart';
import 'package:netflix_project/core/constants.dart';
import 'package:netflix_project/main.dart';
import 'package:netflix_project/presentation/new_and_hot/widgets/comming_soon_widget.dart';
import 'package:netflix_project/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              title: const Text(
                'New & Hot',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  size: 30,
                ),
                kWidth,
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                        avatarImage,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                kWidth
              ],
              bottom: TabBar(
                unselectedLabelColor: kWhite,
                isScrollable: true,
                labelColor: kBlack,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                indicator: BoxDecoration(
                  color: kWhite,
                  borderRadius: kRadius30,
                ),
                tabs: const [
                  Tab(
                    text: '🍿 Comming Soon',
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  )
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              _buildCommingSonn(),
              _buildEveryonesWatching(),
            ],
          )),
    );
  }

  _buildCommingSonn() {
    return FutureBuilder(
        future: getUpcommingMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Show a loading indicator while data is being fetched
          } else if (snapshot.hasError) {
            return Text(
                'Error: ${snapshot.error}'); // Show an error message if an error occurs
          } else if (snapshot.hasData) {
            final movies = snapshot.data!;
            return ListView.builder(
              itemCount: trendingmovies.length,
              itemBuilder: (context, index) => CommingSoonWidget(
                  name: movies[index].title!,
                  description: movies[index].overview!,
                  posterurl: movies[index].backdropPath!),
            );
          } else {
            return const Text(
                'No data available'); // Show a message if no data is available
          }
        });
  }

  _buildEveryonesWatching() {
    return FutureBuilder(
        future: getMovie(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Show a loading indicator while data is being fetched
          } else if (snapshot.hasError) {
            return Text(
                'Error: ${snapshot.error}'); // Show an error message if an error occurs
          } else if (snapshot.hasData) {
            final movies = snapshot.data!;
            return ListView.builder(
              itemCount: trendingmovies.length,
              itemBuilder: (context, index) => EveryonesWatchingWidget(
                  name: movies[index].title,
                  description: movies[index].overview,
                  posterurl: movies[index].backdropPath),
            );
          } else {
            return const Text(
                'No data available'); // Show a message if no data is available
          }
        });
  }
}
