import 'dart:developer';

import 'package:flutter/material.dart';

import '../data_layer_files.dart';

class CategoryProvider with ChangeNotifier {
  final CategoryService _categoryService;

  CategoryProvider(this._categoryService);

  List<Category> _categories = [];
  List<Category> get categories => _categories;

  Future<void> getAllCategories() async {
    try {
      _categories = await _categoryService.getAllCategories();
      notifyListeners();

    } catch (e) {
      log('Failed to fetch categories: $e');
    }
  }
}
