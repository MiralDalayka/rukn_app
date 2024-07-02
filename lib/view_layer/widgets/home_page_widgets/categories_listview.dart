import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data_layer/data_layer_files.dart';
import '../../../utils/utils_files.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryProvider>(context);
    provider.getAllCategories();
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.categories.length,
        itemBuilder: (context, index) {
          final category = provider.categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context,
                  allProductsRoute,
                  arguments:  category.name
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              decoration: BoxDecoration(
                  color:ThemeManager.secondaryColor.withOpacity(0.1) ,
                borderRadius: BorderRadius.circular(50.0),
              border: Border(
                bottom: BorderSide(color: ThemeManager.primaryColor, width: 2.0),

              )
              ),
              child: Center(
                child: Text(
                  category.name.toUpperCase(),
                  style:  TextStyle(color: ThemeManager.primaryColor ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
