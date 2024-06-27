import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product_model.dart';

class ProductService {
  //this class to implement all function to use the api  to get the products data

  //Fetch all products
  Future<List<Product>> getAllProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  //This function to get only one product
  Future<Product> getProductById(int id) async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return Product.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

//this function to get ll products be the category
  Future<Product> getProductByCategory(String categoryName) async {
    final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/category/$categoryName'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return Product.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
