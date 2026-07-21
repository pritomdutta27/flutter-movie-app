import 'package:flutter/material.dart';
import 'package:movie_app/common/extension/size_extensions.dart';
import 'package:movie_app/presentation/app_localizations.dart';
import 'package:movie_app/presentation/journeys/drawer/navigation_expended_list_item.dart';
import 'package:movie_app/presentation/widgets/Logo.dart';

import '../../../common/constants/languages.dart';
import '../../../common/constants/size_constants.dart';
import '../../../common/constants/translation_constants.dart';
import '../../../common/extension/string_extension.dart';
import 'navigation_list_item.dart';

class NavigationMovieDrawer extends StatelessWidget {
  const NavigationMovieDrawer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      width: Sizes.dimen_300.w,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Sizes.dimen_80.h,
              bottom: Sizes.dimen_18.h,
              left: Sizes.dimen_8.w,
              right: Sizes.dimen_8.w,
            ),
            child: Logo(height: Sizes.dimen_80.h),
          ),

          NavigationListItem(
            title:
            TranslationConstants.favoriteMovies.translate(context),
            onPressed: () {},
          ),
          NavigationExpendedListItem(
            title: TranslationConstants.language.translate(context),
            onPressed: () {},
            children: Languages.languages.map((e) => e.value).toList(),
          ),
          NavigationListItem(
            title: TranslationConstants.feedback.translate(context),
            onPressed: () {},
          ),
          NavigationListItem(
            title:
            TranslationConstants.about.translate(context),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
