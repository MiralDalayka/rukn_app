import 'package:flutter/material.dart';
import 'package:rukn_app/data_layer/services/category_service.dart';

import '../models/category_model.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];
  final CategoryService categoryService;

  CategoryProvider(this.categoryService);

  List<Category> get categories => _categories;

  Future<void> fetchCategories() async {
    _categories = await categoryService.getAllCategories();
    notifyListeners();
  }
}
