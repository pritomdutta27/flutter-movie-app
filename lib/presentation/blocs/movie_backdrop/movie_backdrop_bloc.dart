import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'movie_backdrop_event.dart';
import 'movie_backdrop_state.dart';

class MovieBackdropBloc
    extends Bloc<MovieBackdropEvent, MovieBackdropState> {

  MovieBackdropBloc() : super(MovieBackdropInitial()) {
    on<MovieBackdropChangedEvent>(_onBackdropChanged);
  }

  void _onBackdropChanged(
      MovieBackdropChangedEvent event,
      Emitter<MovieBackdropState> emit,
      ) {
    emit(MovieBackdropChanged(event.movie));
  }
}