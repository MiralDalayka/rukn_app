import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data_layer/data_layer_files.dart';
import '../view_layer_files.dart';



class ProductsViewPage extends StatelessWidget {
   ProductsViewPage({super.key ,this.category});

 String? category;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    int productsCount =0;
    List<Product> data =[];
    String title = "";
    if(category==null) {
      productProvider.getAllProducts();
      data = productProvider.products;
      productsCount=productProvider.products.length - 1;
      title = "all products".toUpperCase();
    }else{
      productProvider.getProductsByCategory(category!);
      data = productProvider.tempProducts;
      productsCount=productProvider.tempProducts.length - 1;
      title = "$category".toUpperCase();

    }
    return PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          if (didPop) {
            productProvider.clearTempProducts();
          }
        },
      child: Scaffold(
        appBar: appBarWidget(txt:title ),
        body: ListView.builder(
          key: UniqueKey(),
          itemCount: (data.length / 2).ceil(),
          itemBuilder: (BuildContext context, int index) {
            final int adjustedIndex = productsCount - index;
            if (adjustedIndex >= data.length) {
              return null;
            }
            final Product product1 = data[index];

            final Product product2 = data[adjustedIndex];
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProductCard(
                  product: product1,
                ),
                ProductCard(
                  product: product2,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
