import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/extension/size_extensions.dart';
import 'package:movie_app/common/screenutils/screenutil.dart';

import '../../../common/constants/size_constants.dart';
import '../../../domain/entities/MovieEntity.dart';
import '../../blocs/movie_backdrop/movie_backdrop_bloc.dart';
import '../../blocs/movie_backdrop/movie_backdrop_event.dart';
import 'animated_movie_card_widget.dart';
import 'movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageView({
    super.key,
    required this.movies,
    required this.initialPage,
  }) : assert(
         initialPage >= 0,
         'Initial page must be greater than or equal to 0',
       );

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.65,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final MovieEntity movie = widget.movies[index];
          return AnimatedMovieCardWidget(
            index: index,
            pageController: _pageController,
            movieId: movie.movieId,
            posterPath: movie.moviePosterPath,
          );
        },
        pageSnapping: true,
        itemCount: widget.movies.length,
        onPageChanged: (index) {
          BlocProvider.of<MovieBackdropBloc>(context).add(
            MovieBackdropChangedEvent(widget.movies[index]),
          );
        },
      ),
    );
  }
}
