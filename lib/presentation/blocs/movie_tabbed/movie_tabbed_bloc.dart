import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/usecases/get_coming_soon.dart';
import 'package:movie_app/domain/usecases/get_playing_now.dart';
import 'package:movie_app/domain/usecases/get_popular.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabbed_event.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabbed_state.dart';

import '../../../domain/entities/MovieEntity.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabbedBloc({required this.getPopular,required this.getPlayingNow,required this.getComingSoon})
    : super(MovieTabbedInitial()) {
    on<MovieTabChangeEvent>(_onLoadMovie);
  }

  Future<void> _onLoadMovie(
      MovieTabChangeEvent event,
      Emitter<MovieTabbedState> emit, ) async {

    late Either<AppError, List<MovieEntity>> movieEither;

    switch (event.currentTabIndex) {
      case 0:
        movieEither = await getPopular(NoParams());
        break;

      case 1:
        movieEither = await getPlayingNow(NoParams());
        break;

      case 2:
        movieEither = await getComingSoon(NoParams());
        break;

      default:
        emit(MovieTabError());
        return;
    }

    movieEither.fold(
          (failure) => emit(MovieTabError()),
          (movies) => emit(
        MovieTabChanged(
          event.currentTabIndex,
          movies,
        ),
      ),
    );
  }
}
