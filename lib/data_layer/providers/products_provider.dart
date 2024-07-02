import 'dart:developer';

import 'package:flutter/material.dart';

import '../data_layer_files.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> _tempProducts = [];
  List<Product> _selectedProducts = [];

  final ProductService _productService;

  ProductProvider(
      this._productService); //TODO back  final ProductService productService = Pr();

  List<Product> get products => _products;
  List<Product> get tempProducts => _tempProducts;
  List<Product> get selectedProducts => _selectedProducts;



  Future<void> getAllProducts() async {
    try {
      _products = await _productService.getAllProducts();
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
//get limited products
  Future<void> getLimitedProducts() async {
    try {
      _selectedProducts = await _productService.getLimitedProducts(5);
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
  Future<Product> getProductByID(int id) async {
    try {
      // return _products.where((element) => element.id == id).first;
      //or we can use the api
      return await _productService.getProductById(id);
    } catch (e) {
      log(e.toString());
    }
    return Product(id: -1, title: '', price: 0, description: '', category: '', image: '', rating: Rating(rate: 0,count: 0));
  }

  Future<void> getProductsByCategory(String categoryId) async {
    try {
      _tempProducts = await _productService.getProductByCategory(categoryId);
      notifyListeners();
    } catch (e) {
      log('Failed to fetch products by category: $e');
    }
  }

  void clearTempProducts() {
    _tempProducts=[];
    notifyListeners();
  }


}
