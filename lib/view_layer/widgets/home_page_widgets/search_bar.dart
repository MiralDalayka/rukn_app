import 'package:flutter/material.dart';

import '../../../utils/utils_files.dart';

class CircularSearchBar extends StatelessWidget {
  const CircularSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border(
          bottom: BorderSide(color: ThemeManager.primaryColor, width: 2.0),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: ThemeManager.primaryColor),
          const SizedBox(width: 10.0),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: ThemeManager.primaryColor),
              ),
              style: TextStyle(color: ThemeManager.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
