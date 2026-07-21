import 'package:equatable/equatable.dart' show Equatable;

class MovieEntity extends Equatable {
  final String moviePosterPath;
  final int movieId;
  final String moviePackDropPath;
  final String movieTitle;
  final num movieVoteAverage;
  final String movieReleaseDate;
  final String movieOverview;

  const MovieEntity({
    required this.moviePosterPath,
    required this.movieId,
    required this.moviePackDropPath,
    required this.movieTitle,
    required this.movieVoteAverage,
    required this.movieReleaseDate,
    required this.movieOverview,
  });

  @override
  List<Object?> get props => [movieId, movieTitle];

  @override
  bool get stringify => true;

}
