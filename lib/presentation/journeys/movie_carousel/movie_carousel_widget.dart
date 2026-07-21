
import 'package:flutter/cupertino.dart';
import 'package:movie_app/common/extension/size_extensions.dart';
import 'package:movie_app/presentation/journeys/movie_carousel/movie_page_view.dart';
import 'package:movie_app/presentation/widgets/movie_app_bar.dart';

import '../../../common/constants/size_constants.dart';
import '../../../domain/entities/MovieEntity.dart';
import '../../widgets/separator.dart';
import 'movie_backdrop_widget.dart';
import 'movie_data_widget.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  MovieCarouselWidget({
    super.key,
    required this.movies,
    required this.defaultIndex,
  }) : assert(defaultIndex >= 0, 'Default index must be greater than or equal to 0');

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children:[
        MovieBackdropWidget(),
        Column(
        children: [
          MovieAppBar(),
          MoviePageView(movies: movies, initialPage: defaultIndex),
          MovieDataWidget(),
          SizedBox(height: Sizes.dimen_4.h),
          Separator()
        ],
      )],
    );
  }

}