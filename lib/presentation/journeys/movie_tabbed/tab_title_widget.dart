import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/extension/size_extensions.dart';

import '../../../common/constants/size_constants.dart';
import '../../themes/them_text.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTab;
  final bool isSelected;

  const TabTitleWidget({
    super.key,
    required this.title,
    required this.onTab,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? Colors.grey : Colors.transparent,
              width: Sizes.dimen_1.sp,
            ),
          ),
        ),
        child: Text(
          title,
          style: isSelected
              ? Theme.of(context).textTheme.royalBlueSubTitle1
              : Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}