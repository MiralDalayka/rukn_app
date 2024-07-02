import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data_layer_files.dart' ;


class CategoryService {
  //this function to get all categories name
  Future<List<Category>> getAllCategories() async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Category.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
