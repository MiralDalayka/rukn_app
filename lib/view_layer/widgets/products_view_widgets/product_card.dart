import 'package:flutter/material.dart';

import '../../../data_layer/data_layer_files.dart';
import '../../../utils/utils_files.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

 final Product product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, productDetailsRoute,arguments: product.id);
        },
        child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            border: Border.all(color: ThemeManager.thirdColor.withOpacity(0.6)),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: ThemeManager.thirdColor,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 14
                  ,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                '\$${product.price}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: ThemeManager.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}