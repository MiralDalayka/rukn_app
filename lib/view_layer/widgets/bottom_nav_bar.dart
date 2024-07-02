import 'package:flutter/material.dart';

import '../../utils/theme_manager.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -3), // changes position of shadow
            ),
          ],
          border: Border(
            bottom: BorderSide(color: ThemeManager.primaryColor, width: 2.0),
          ),
          borderRadius: BorderRadius.circular(40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavItem(Icons.home_outlined, 0),
          _buildNavItem(Icons.explore_outlined, 1),
          _buildNavItem(Icons.notifications_outlined, 2),
          _buildNavItem(Icons.person_outline, 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Icon(
          icon,
          size: 28,
          color: _selectedIndex == index ? ThemeManager.secondaryColor : Colors.grey,
        ),
      ),
    );
  }
}
