import 'package:flutter/material.dart';

import 'navigation_sub_item.dart';

class NavigationExpendedListItem extends StatelessWidget {
  final String title;
  final List<String> children;
  final VoidCallback onPressed;

  const NavigationExpendedListItem({
    super.key,
    required this.title,
    required this.children,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 2,
            ),
          ],
        ),
        child: ExpansionTile(
          shape: LinearBorder.none,
          title: Text(title, style: Theme.of(context).textTheme.titleSmall),
          children: [
            for (final child in children)
              NavigationSubItem(title: child, onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}
