
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/extension/size_extensions.dart';

import '../../../common/constants/size_constants.dart';
import '../../blocs/movie_backdrop/movie_backdrop_bloc.dart';
import '../../blocs/movie_backdrop/movie_backdrop_state.dart';

class MovieDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
      builder: (context, state) {
        if (state is MovieBackdropChanged) {
          return Text(
            state.movie.movieTitle,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextStyle(fontSize: Sizes.dimen_14.sp, color: Colors.white, fontWeight: FontWeight.bold),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}