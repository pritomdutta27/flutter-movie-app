import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/extension/size_extensions.dart';
import 'package:movie_app/common/extension/string_extension.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabbed_event.dart';
import 'package:movie_app/presentation/journeys/movie_tabbed/movie_list_view_builder.dart';
import 'package:movie_app/presentation/journeys/movie_tabbed/movie_tabbed_constants.dart';
import 'package:movie_app/presentation/journeys/movie_tabbed/tab_title_widget.dart';

import '../../../common/constants/size_constants.dart';
import '../../app_localizations.dart';
import '../../blocs/movie_tabbed/movie_tabbed_state.dart';

class MovieTabbedWidget extends StatefulWidget {
  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);
  int currentTabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieTabbedBloc.add(MovieTabChangeEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsetsGeometry.only(top: Sizes.dimen_4.h),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (
                    var i = 0;
                    i < MovieTabbedConstants.movieTabs.length;
                    i++
                  )
                    TabTitleWidget(
                      title:
                      MovieTabbedConstants.movieTabs[i].title.translate(context),
                      onTab: () => _onTapped(i),
                      isSelected:
                          state.currentTabIndex ==
                          MovieTabbedConstants.movieTabs[i].index,
                    ),
                ],
              ),
              if (state is MovieTabChanged)
                Expanded(child: MovieListViewBuilder(movies: state.movies)),
            ],
          ),
        );
      },
    );
  }

  void _onTapped(int index) {
    currentTabIndex = index;
    movieTabbedBloc.add(MovieTabChangeEvent(currentTabIndex: currentTabIndex));
  }
}
