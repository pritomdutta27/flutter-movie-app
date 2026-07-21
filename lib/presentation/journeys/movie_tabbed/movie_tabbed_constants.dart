import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/presentation/journeys/movie_tabbed/tab.dart';

class MovieTabbedConstants {
  static final List<Tab> movieTabs = [
    Tab(index: 0, title: TranslationConstants.popular),
    Tab(index: 1, title: TranslationConstants.now),
    Tab(index: 2, title: TranslationConstants.soon),
  ];
}
