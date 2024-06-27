import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rukn_app/data_layer/models/category_model.dart' as model;

class CategoryService {
  //this function to get all categories name
  Future<List<model.Category>> getAllCategories() async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => model.Category.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
