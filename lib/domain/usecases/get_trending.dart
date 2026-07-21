
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

import '../entities/MovieEntity.dart';
import '../entities/app_error.dart';
import '../entities/no_params.dart';

class GetTrending extends UseCase<List<MovieEntity>, NoParams>{
  final MovieRepository repository;

  GetTrending(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await repository.fetchTrendingMovies();
  }
}