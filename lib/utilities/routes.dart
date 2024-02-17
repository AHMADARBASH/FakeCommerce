import 'package:fakecommerce/layout/screens/login_screen.dart';
import 'package:fakecommerce/layout/screens/product_details_screen.dart';
import 'package:fakecommerce/layout/screens/main_screen.dart';
import 'package:fakecommerce/utilities/context_extenstions.dart';
import 'package:fakecommerce/utilities/route_animation.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainScreen.routeName:
        return SizeTransitionAnimation(
          page: MainScreen(),
        );
      case ProductDetailsScreen.routeName:
        Map<String, dynamic> routeData =
            settings.arguments! as Map<String, dynamic>;
        return SizeTransitionAnimation(
          page: ProductDetailsScreen(
            product: routeData['product'],
          ),
        );
      case LoginScreen.routeName:
        return SizeTransitionAnimation(
          page: LoginScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: context.tertiary,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              title: const Text(
                'Error Route',
              )),
          body: const Center(child: Text('Error Route')),
        ),
      );
    });
  }
}
