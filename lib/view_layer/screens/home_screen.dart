import 'package:flutter/material.dart';

import '../../utils/utils_files.dart';
import '../view_layer_files.dart';
import '../widgets/bottom_nav_bar.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 16),
            const CircularSearchBar(),
            const SizedBox(height: 16),
            SalesSlider(imageUrls: salesImages),
            const SizedBox(height: 16),
            const CategoriesList(),
            const SizedBox(height: 16),
          ...
          homePageProductsView(context)
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar (),
    );
  }
}