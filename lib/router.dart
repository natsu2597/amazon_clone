import 'package:amazon_clone/features/admin/screens/add_products_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/category_screen.dart';
import 'package:amazon_clone/features/product_details/screens/product_detail_screen.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/shared/widgets/bottomBar.dart';
import 'package:flutter/material.dart';

import 'features/home/screens/home_screen.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const AuthScreen());

    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const BottomBar());

    case AddProductsScreen.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const AddProductsScreen());

    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const HomeScreen());

    case CategoryDealScreen.routeName:
      var category = settings.arguments as String;
      return MaterialPageRoute(
          settings: settings,
          builder: (_) => CategoryDealScreen(
                category: category,
              ));

    case SearchScreen.routeName:
      var searchQuery = settings.arguments as String;
      return MaterialPageRoute(
          settings: settings,
          builder: (_) => SearchScreen(
                query: searchQuery,
              ));

    case ProductDetailsScreen.routeName:
      var product = settings.arguments as Product;
      return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProductDetailsScreen(
                product: product,
              ));

    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                    child: Text('Error loading check internet connection')),
              ));
  }
}
