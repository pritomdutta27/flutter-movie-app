
import 'package:flutter/material.dart';

class NavigationListItem extends StatelessWidget {

  final String title;
  final VoidCallback onPressed;

  const NavigationListItem({super.key, required this.title, required this.onPressed});


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
            )
          ]
        ),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      )
    );
  }

}