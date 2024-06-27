import 'package:flutter/material.dart';
import 'package:rukn_app/data_layer/services/products_service.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  final ProductService productService;

  ProductProvider(this.productService); //TODO back  final ProductService productService = Pr();

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    _products = await productService.getAllProducts();
    notifyListeners();
  }
}
