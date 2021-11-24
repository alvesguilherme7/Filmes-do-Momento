class MovieModel {
  final int id;
  final String title;
  final String releaseDate;
  final String posterPath;
  final List<dynamic> genres;
  final bool favorite;

  const MovieModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.posterPath,
    required this.genres,
    required this.favorite,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'release_date': this.releaseDate,
      'poster_path': this.posterPath,
      'genre_ids': this.genres,
      'favorite': this.favorite,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] ?? int,
      title: map['title'] ?? '',
      releaseDate: map['release_date'] ?? '',
      posterPath: map['poster_path'],
      genres: map['genre_ids'] ?? <int>[],
      favorite: map['favorite'] ?? false,
    );
  }

  MovieModel copyWith({
    int? id,
    String? title,
    String? releaseDate,
    String? posterPath,
    List<dynamic>? genres,
    bool? favorite,
  }) {
    return MovieModel(
      id: id ?? this.id,
      title: title ?? this.title,
      releaseDate: releaseDate ?? this.releaseDate,
      posterPath: posterPath ?? this.posterPath,
      genres: genres ?? this.genres,
      favorite: favorite ?? this.favorite,
    );
  }
}