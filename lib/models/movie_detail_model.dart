import 'package:app_filmes/models/genre_model.dart';

import 'cast_model.dart';

class MovieDetailModel {
  final String title;
  final double stars;
  final List<GenreModel> genres;
  final List<String> urlImages;
  final DateTime releaseDate;
  final String overview;
  final List<String> productionCompanies;
  final String originalLanguage;
  final List<CastModel> cast;

  const MovieDetailModel({
    required this.title,
    required this.stars,
    required this.genres,
    required this.urlImages,
    required this.releaseDate,
    required this.overview,
    required this.productionCompanies,
    required this.originalLanguage,
    required this.cast,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'stars': this.stars,
      'genres': this.genres.map((e) => e.toMap()).toList(),
      'urlImages': this.urlImages,
      'releaseDate': this.releaseDate,
      'overview': this.overview,
      'productionCompanies': this.productionCompanies,
      'originalLanguage': this.originalLanguage,
      'cast': this.cast.map((e) => e.toMap()).toList(),
    };
  }

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    final urlBaseImages = 'https://image.tmdb.org/t/p/w200';
    final urlImagesPosters = map['images']['posters'];
    final urlImages =
        urlImagesPosters?.map<String>((i) => '$urlBaseImages/${i['file_path']}').toList() ?? [];

    return MovieDetailModel(
      title: map['title'] ?? '',
      stars: map['vote_average'] ?? 0,
      genres: List<GenreModel>.from(
          map['genres']?.map((x) => GenreModel.fromMap(x)) ?? []),
      urlImages: urlImages,
      releaseDate: DateTime.parse(map['release_date']),
      overview: map['overview'] ?? '',
      productionCompanies: List<dynamic>.from(map['production_companies'] ?? [])
          .map<String>((p) => p['name'])
          .toList(),
      originalLanguage: map['original_language'] as String,
      cast: List<CastModel>.from(
          map['credits']['cast']?.map((c) => CastModel.fromMap(c)) ?? const []),
    );
  }
}
