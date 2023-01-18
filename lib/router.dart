import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';


Route<dynamic> generateRoutes(RouteSettings settings){

  switch(settings.name){
    case AuthScreen.name:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const AuthScreen());

    

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold(
        body: Center(child: Text('Error loading check internet connection')),
      ));
  }
}