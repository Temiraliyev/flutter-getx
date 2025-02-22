// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final Widget child;
  final String title;
  final bool isTitle;
  const ProfileCard({
    super.key,
    required this.child,
    required this.title,
    this.isTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding:
          isTitle
              ? EdgeInsets.symmetric(horizontal: 24, vertical: 30)
              : EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color:
            isDarkMode ? Colors.white12 : Colors.grey[100], // Background color
        borderRadius: BorderRadius.circular(18.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 1.0,
            blurRadius: 12.0,
            offset: Offset(1, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isTitle
              ? Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(fontSize: 18),
              )
              : SizedBox(),
          isTitle ? SizedBox(height: 24) : SizedBox(),
          child,
        ],
      ),
    );
  }
}
