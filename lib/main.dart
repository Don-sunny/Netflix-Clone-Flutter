import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_project/application/bloc/search_bloc.dart';
import 'package:netflix_project/application/downloads/downloads_bloc.dart';
import 'package:netflix_project/application/movie_data/api_functions.dart';
import 'package:netflix_project/application/movie_data/movie_data.dart';
import 'package:netflix_project/application/past_year_movies/api_functions.dart';
import 'package:netflix_project/application/south_indian/api_functions.dart';
import 'package:netflix_project/application/tense_drama/api_functions.dart';
import 'package:netflix_project/application/top_rated/api_functions.dart';
import 'package:netflix_project/core/colors.dart/colors.dart';
import 'package:netflix_project/domain/core/di/injectable.dart';

import 'package:netflix_project/presentation/main_page/screen_main_page.dart';

List<MovieData> trendingmovies = [];

List topratedmovies = [];

List releasedinthepastyear = [];

List tensedrama = [];

List southindian = [];

String backgroundimage = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
  trendingmovies = await getMovie();
  releasedinthepastyear = await getPastYearMovies();
  topratedmovies = await getTopRatedMovies();
  tensedrama = await getTenseDrama();
  southindian = await getSouthIndian();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<DownloadsBloc>()),
          BlocProvider(create: (context) => getIt<SearchBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
            ),
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: backgroundColor,
            colorScheme: const ColorScheme.dark(background: backgroundColor),
            // useMaterial3: true,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white),
            ),
          ),
          home: ScreenMainPage(),
        ));
  }
}
