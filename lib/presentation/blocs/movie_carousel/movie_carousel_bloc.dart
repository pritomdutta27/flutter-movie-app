
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/usecases/get_trending.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_event.dart';

import '../../../domain/entities/no_params.dart';
import 'movie_carousel_event.dart';
import 'movie_carousel_state.dart';

class MovieCarouselBloc
    extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc({
    required this.getTrending,
    required this.movieBackdropBloc,
  }) : super(MovieCarouselInitial()) {
    on<CarouselLoadEvent>(_onLoadMovieCarousel);
  }

  Future<void> _onLoadMovieCarousel(
      CarouselLoadEvent event,
      Emitter<MovieCarouselState> emit,) async {

    final result = await getTrending(NoParams());

    result.fold(
          (failure) {
        emit(MovieCarouselError());
      },
          (movies) {
            movieBackdropBloc.add(MovieBackdropChangedEvent(movies[event.defaultIndex]));
        emit(
          MovieCarouselLoaded(
            movies: movies,
            defaultIndex: event.defaultIndex,
          ),
        );
      },
    );
  }
}