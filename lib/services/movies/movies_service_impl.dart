import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:app_filmes/repositories/movies/movies_repository.dart';

import 'movies_service.dart';

class MoviesServiceImpl implements MoviesService {

  MoviesRepository _moviesRepository;

  MoviesServiceImpl({required MoviesRepository moviesRepository}) : this._moviesRepository = moviesRepository;

  @override
  Future<List<MovieModel>> getPopularMovies() => _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieModel>> getTopRated() => _moviesRepository.getTopRated();

  @override
  Future<MovieDetailModel?> getDetail(int id) => _moviesRepository.getDetail(id);

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movieModel) => _moviesRepository.addOrRemoveFavorite(userId, movieModel);

  @override
  Future<List<MovieModel>> getFavoritiesMovies(String userId) => _moviesRepository.getFavoritiesMovies(userId);

}