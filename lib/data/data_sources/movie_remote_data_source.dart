import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/models/MovieModel.dart';
import '../models/MovieResultModel.dart';

abstract class MovieRemoteDataSource {
    Future<List<MovieModel>> getTrendingMovies();
    Future<List<MovieModel>> getPopularMovies();
    Future<List<MovieModel>> getPlayingNowMovies();
    Future<List<MovieModel>> getComingSoonMovies();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {

  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
      final response = await _client.get('/trending/movie/day');
      final movies = MovieResultModel.fromJson(response).results;
      //print(movies ?? []);
      return movies ?? [];
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await _client.get('/movie/popular');
    final movies = MovieResultModel.fromJson(response).results;
    //print(movies ?? []);
    return movies ?? [];
  }

  @override
  Future<List<MovieModel>> getComingSoonMovies() async {
    final response = await _client.get('/movie/now_playing');
    final movies = MovieResultModel.fromJson(response).results;
    //print(movies ?? []);
    return movies ?? [];
  }

  @override
  Future<List<MovieModel>> getPlayingNowMovies() async {
    final response = await _client.get('/movie/upcoming');
    final movies = MovieResultModel.fromJson(response).results;
    //print(movies ?? []);
    return movies ?? [];
  }

}