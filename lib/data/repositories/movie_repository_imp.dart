
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/MovieEntity.dart';
import 'package:movie_app/domain/entities/app_error.dart';

import '../../domain/repositories/movie_repository.dart';
import '../data_sources/movie_remote_data_source.dart';

class MovieRepositoryImp extends MovieRepository{

  final MovieRemoteDataSource _remoteDataSource;

  MovieRepositoryImp(this._remoteDataSource);

  @override
  Future<Either<AppError, List<MovieEntity>>> fetchTrendingMovies() async {
    try{
      final movies = await _remoteDataSource.getTrendingMovies();
      return Right(movies);
    }on Exception{
      return Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> fetchComingSoonMovies() async{
    try{
      final movies = await _remoteDataSource.getComingSoonMovies();
      return Right(movies);
    }on Exception{
      return Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> fetchPlayingNowMovies() async{
    try{
      final movies = await _remoteDataSource.getPlayingNowMovies();
      return Right(movies);
    }on Exception{
      return Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> fetchPopularMovies() async{
    try{
      final movies = await _remoteDataSource.getPopularMovies();
      return Right(movies);
    }on Exception{
      return Left(AppError("Something went wrong"));
    }
  }

}