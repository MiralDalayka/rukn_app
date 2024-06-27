import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rukn_app/data_layer/services/category_service.dart';

import 'data_layer/providers/categories_provider.dart';
import 'data_layer/providers/products_provider.dart';
import 'data_layer/services/products_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ProductService productService = ProductService();
    CategoryService categoryService = CategoryService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider(productService)),
        ChangeNotifierProvider(create: (_) => CategoryProvider(categoryService)),
      ],
      child: MaterialApp(
        home: MyHomePage(title: 'asdfgh',),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {
    ProductService service=ProductService();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:()async{
          // await service.fetchData();
          await service.getProductByCategory("jewelery");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
