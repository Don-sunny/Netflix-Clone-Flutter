import 'package:netflix_project/core/strings.dart';
import 'package:netflix_project/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = '$kBaseUrl/trending/movie/day?api_key=$apiKey';

  static const search = '$kBaseUrl/search/movie?api_key=$apiKey';
}
