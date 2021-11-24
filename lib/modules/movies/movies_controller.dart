import 'package:app_filmes/application/auth/auth_service.dart';
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/models/genre_model.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:app_filmes/services/genres/genres_service.dart';
import 'package:app_filmes/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessageMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final AuthService _authService;

  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;

  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  final _popularMoviesOriginal = <MovieModel>[];
  final _topRatedMoviesOriginal = <MovieModel>[];

  final genreSelected = Rxn<GenreModel>();

  MoviesController(
      {required GenresService genresService,
      required MoviesService moviesService,
      required AuthService authService})
      : _genresService = genresService,
        _moviesService = moviesService,
        _authService = authService;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final genres = await _genresService.getGenres();
      this.genres.assignAll(genres);

      await _getMovies();
    } catch (e, s) {
      print(e);
      print(s);
      _message(MessageModel.error(
          title: 'Erro', message: 'Erro ao carregar dados da página'));
    }
  }

  Future<void> _getMovies() async {
    final popularMovies = await _moviesService.getPopularMovies();
    final topRatedMovies = await _moviesService.getTopRated();
    final favoritesMovies = await getFavorites();

    popularMovies.assignAll(popularMovies.map((movie) {
      if (favoritesMovies.containsKey(movie.id)) {
        return movie.copyWith(favorite: true);
      } else {
        return movie.copyWith(favorite: false);
      }
    }).toList());

    topRatedMovies.assignAll(topRatedMovies.map((movie) {
      if (favoritesMovies.containsKey(movie.id)) {
        return movie.copyWith(favorite: true);
      } else {
        return movie.copyWith(favorite: false);
      }
    }).toList());

    this.popularMovies.assignAll(popularMovies);
    this._popularMoviesOriginal.assignAll(popularMovies);

    this.topRatedMovies.assignAll(topRatedMovies);
    this._topRatedMoviesOriginal.assignAll(topRatedMovies);
  }

  void filterByName(String title) {
    title = title.toLowerCase();
    if (title.isNotEmpty) {
      final newPopularMovies = this
          ._popularMoviesOriginal
          .where((m) => m.title.toLowerCase().contains((title)));
      final newTopRatedMovies = this
          ._topRatedMoviesOriginal
          .where((m) => m.title.toLowerCase().contains((title)));

      this.popularMovies.assignAll(newPopularMovies);
      this.topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      this.popularMovies.assignAll(this._popularMoviesOriginal);
      this.topRatedMovies.assignAll(this._topRatedMoviesOriginal);
    }
  }

  void filterMoviesByGenre(GenreModel? genreModel) {
    if (genreModel?.id == genreSelected.value?.id) {
      genreModel = null;
    }

    genreSelected.value = genreModel;

    if (genreModel != null) {
      final newPopularMovies = this
          ._popularMoviesOriginal
          .where((movie) => movie.genres.contains(genreModel?.id));
      final newTopRatedMovies = this
          ._topRatedMoviesOriginal
          .where((movie) => movie.genres.contains(genreModel?.id));

      this.popularMovies.assignAll(newPopularMovies);
      this.topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      this.popularMovies.assignAll(this._popularMoviesOriginal);
      this.topRatedMovies.assignAll(this._topRatedMoviesOriginal);
    }
  }

  Future<void> favoriteMovie(MovieModel movie) async {
    final user = _authService.user;
    if (user != null) {
      final newMovie = movie.copyWith(favorite: !movie.favorite);
      await _moviesService.addOrRemoveFavorite(user.uid, newMovie);
      await _getMovies();
    }
  }

  Future<Map<int, MovieModel>> getFavorites() async {
    final user = _authService.user;
    if (user != null) {
      final favorites = await _moviesService.getFavoritiesMovies(user.uid);
      return <int, MovieModel>{
        for (var fav in favorites) fav.id: fav,
      };
    }
    return <int, MovieModel>{};
  }
}
