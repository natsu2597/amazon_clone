


import 'dart:convert';

import 'package:amazon_clone/constants/error_handler.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../constants/global_variables.dart';

class HomeServices{
  Future<List<Product>> fetchCategoryProducts({
    required BuildContext context,required String category
    }) async{
      final userProvider = Provider.of<UserProvider>(context,listen: false);
      List<Product> listProducts = [];

      try{
        http.Response res = await http.get(Uri.parse('$uri/api/products?category=$category'),
        headers: {
            'Content-Type' : 'application/json; charset=UTF-8',
            'auth-token' : userProvider.user.token,
        } 
        );
        httpErrorHandler(response: res, context: context, onSuccess: (){
          print("object");
            for(int i = 0 ;i < jsonDecode(res.body).length ; i++)
          {
            listProducts.add(Product.fromJson(jsonEncode(jsonDecode(res.body)[i],),
            ),
            );
            // print("object");
          }
        });
        
      }

      catch(e)
      {
        // showSnackBar(context, e.toString());
        print(e.toString());
      }
      // print(listProducts);
      return listProducts;
    }

    Future<Product> getDealOfTheDay({
      required BuildContext context
    }) async
    {
      final userProvider = Provider.of<UserProvider>(context,listen: false);
      Product product = Product(
        name: '',
        description: '',
        quantity: 0,
        price: 0,
        images: [],
        category: ''
        );
      try{    
          http.Response res = await http.get(Uri.parse('$uri/api/deal-of-the-day'),
          headers: {
            'Content-Type' : 'application/json; charset=UTF-8',
            'auth-token' : userProvider.user.token,
          });
          httpErrorHandler(response: res, context: context, onSuccess: (){
            product = Product.fromJson(res.body);
          });
      }
      catch(e)
      {
        // showSnackBar(context, e.toString());
        print(e.toString());
      }

      return product;
    }
}