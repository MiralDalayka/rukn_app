import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rukn_app/utils/theme_manager.dart';
import 'package:rukn_app/utils/utils_files.dart';
import '../../data_layer/data_layer_files.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productId});

final  int productId;

  @override
  Widget build(BuildContext context) {
    Color color = ThemeManager.primaryColor;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeManager.backgroundColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: color,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Icon(
              Icons.ios_share_outlined,
              color: color,
            ),
            const SizedBox(
              width: 20,
            ),
            Icon(
              Icons.shopping_cart_outlined,
              color: color,
            ),
            const SizedBox(
              width: 20,
            ),
          ],
          title: Text(
            "Product Details",
            style: TextStyle(color: color, fontSize: 18),
          ),
        ),
        body: FutureBuilder(
            future: Provider.of<ProductProvider>(context, listen: false)
                .getProductByID(productId),
            builder: (context, snapshot) {
              Product? product = snapshot.data;
              if (product != null) {
                return SingleChildScrollView(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Product Image
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            product.image,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),

                      // Product Title and Price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "\$${product.price.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(
                                          color: ThemeManager.primaryColor)),
                                ),
                                child: Text(
                                  "Add to Cart",
                                  style:
                                      TextStyle(color: ThemeManager.thirdColor),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20.0),

                      // Product Description
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeManager.thirdColor),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              product.description,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),

                      // Product Rating
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rating & Reviews",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeManager.thirdColor),
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.yellow),
                                const SizedBox(width: 8.0),
                                Text(
                                  "${product.rating.rate.toString()} (${product.rating.count} ratings)",
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Add to Cart Button
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: ThemeManager.secondaryColor,
                ),
              );
            }));
  }
}
