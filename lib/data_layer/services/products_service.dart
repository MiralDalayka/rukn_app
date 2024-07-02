import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data_layer_files.dart';

class ProductService {
  //this class to implement all function to use the api  to get the products data

  //Fetch all products
  Future<List<Product>> getAllProducts() async {
    final response =
    await http.get(Uri.parse('https://fakestoreapi.com/products'));
    List<Product> list = [];
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      for (var item in data) {
        list.add(Product.fromJson(item));
      }
      return list;
    } else {
      throw Exception('Failed to load data');
    }
  }

  //this function to get limited products

  Future<List<Product>> getLimitedProducts(int numOfProducts) async {
    final response =
    await http.get(Uri.parse('https://fakestoreapi.com/products?limit=$numOfProducts'));
    List<Product> list = [];
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      for (var item in data) {
        list.add(Product.fromJson(item));
      }
      return list;
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
      if (data != null) {
        return Product.fromJson(data);
      } else {
        throw Exception('Product data is null');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

//this function to get ll products be the category
  Future<List<Product>> getProductByCategory(String categoryName) async {
    final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/category/$categoryName'));
    List<Product> list = [];
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      for (var item in data) {
        list.add(Product.fromJson(item));
      }
      return list;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
