import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rukn_app/utils/utils_files.dart';
import '../../../data_layer/data_layer_files.dart';

//use this in home page
List<Widget> homePageProductsView(BuildContext context) {
  double height = 30, width = 30;
  return [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: iconsPath.map((iconPath) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  iconPath,
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
          ),
          TextButton(
            onPressed: () {
              //move to a page that view all products
              Navigator.pushNamed(context, allProductsRoute);
            },
            child: const Text(
              "See All",
            ),
          )
        ],
      ),
    ),
    const ProductsList()
  ];
}
//used on home page
class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    productProvider.getLimitedProducts(); // Fetch products when the widget is built
    return Expanded(
      child: ListView.builder(
        itemCount: productProvider.selectedProducts.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final product = productProvider.selectedProducts[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, productDetailsRoute,arguments: product.id);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                        child: Image.network(
                          product.image,
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20,),
                        SizedBox(
                          width: 100,
                          child: Text(
                            product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 10,),

                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(height: 10,),

                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            SizedBox(width: 4.0),
                            Text(
                              '${product.rating.rate.toString()}',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
