import 'dart:convert';

import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/constants/error_handler.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../constants/global_variables.dart';

class CartServices {
  void removeProduct({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.delete(
        Uri.parse('$uri/api/remove-product/${product.id}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': userProvider.user.token,
        },

      );
      httpErrorHandler(response: res, context: context, onSuccess: (){
        UserModel user = userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
        userProvider.setUserFromModel(user);
      });
    } catch (e) {
      // showSnackBar(context, e.toString());
      print(e.toString());
    }
  }
}
