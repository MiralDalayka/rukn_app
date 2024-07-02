import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_layer/data_layer_files.dart';
import 'utils/utils_files.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ProductService productService = ProductService();
    CategoryService categoryService = CategoryService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider(productService)),
        ChangeNotifierProvider(create: (_) => CategoryProvider(categoryService)),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: MyRouter.generateRoute,
        initialRoute: initRoute,
        theme: appTheme,
      ),
    );
  }
}





