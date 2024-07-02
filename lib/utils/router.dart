
import 'package:flutter/material.dart';



import '../view_layer/view_layer_files.dart';
import 'const_routers.dart';

class MyRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initRoute:
        {
          return _route(SplashScreen());
        }
      case homeRoute:
        {
          return _route(const HomePage());
        }
      case productDetailsRoute:
        {
          int id = settings.arguments as int;
          return _route(ProductDetails(productId: id));
        }

      case allProductsRoute:
        {
          var id = settings.arguments ;
          if(id!=null) {
            return _route( ProductsViewPage(category:id.toString()));
          }
          return _route( ProductsViewPage());


        }
      default:
        {
          final arg = settings.name as String;
          return _route(UndefineRoute(routeName: arg));
        }
    }
  }

  // Helper method to create a MaterialPageRoute
  static MaterialPageRoute _route(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}

class UndefineRoute extends StatelessWidget {
  const UndefineRoute({super.key, required this.routeName});

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This $routeName is Undefine Route',
        ),
      ),
    );
  }
}
