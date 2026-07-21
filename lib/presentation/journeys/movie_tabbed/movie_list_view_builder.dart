import 'package:flutter/cupertino.dart';
import 'package:movie_app/common/extension/size_extensions.dart';
import 'package:movie_app/domain/entities/MovieEntity.dart';
import 'movie_tab_card_widget.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilder({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 40.h),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          return MovieTabCardWidget(
            movieId: movies[index].movieId,
            title: movies[index].movieTitle,
            posterPath: movies[index].moviePosterPath,
          );
        },
      ),
    );
  }
}
