import 'dart:convert';

import 'package:amazon_clone/constants/error_handler.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../constants/global_variables.dart';

class ProductDetailsServices{

  void addToCart({
    required BuildContext context,
    required Product product
  }) async{

    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try{
      http.Response res = await http.post(Uri.parse('$uri/api/add-to-cart'),
      headers: {
         'Content-Type' : 'application/json; charset=UTF-8',
          'auth-token' : userProvider.user.token,
      },
      body: jsonEncode({
        'id' : product.id!
      })
      );

      httpErrorHandler(response: res, context: context, onSuccess: (){
          UserModel user = userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
          userProvider.setUserFromModel(user);
      });
    }

    catch(e)
    {
      showSnackBar(context, e.toString());
    }
  }




  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating
  }) async {

    final userProvider = Provider.of<UserProvider>(context,listen: false);

    try{
      http.Response res = await http.post(Uri.parse('$uri/api/rate-product'),
      headers: {
         'Content-Type' : 'application/json; charset=UTF-8',
          'auth-token' : userProvider.user.token,
      },
      body: jsonEncode({
        'id' : product.id!,
        'rating' : rating
      })
      );

      httpErrorHandler(response: res, context: context, onSuccess: (){
        
      });
    }

    catch(e)
    {
      showSnackBar(context, e.toString());
    }

  }
}