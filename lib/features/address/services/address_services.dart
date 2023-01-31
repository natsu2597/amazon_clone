import 'dart:convert';

import 'package:amazon_clone/constants/error_handler.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../constants/global_variables.dart';
import '../../../models/user.dart';

class AddressServices {
  void saveUserAdd({
    required BuildContext context,
    required String address,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res =
          await http.post(Uri.parse('$uri/api/save-user-address'),
              headers: {
                'Content-Type': 'application/json; charset=UTF-8',
                'auth-token': userProvider.user.token,
              },
              body: jsonEncode({
                'address': address,
              }));

      httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () {
          UserModel user = userProvider.user
              .copyWith(address: jsonDecode(res.body)['address']);
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void placeOrder({
    required BuildContext context,
    required String address,
    required double totalAmount,
  }) async {
    
    
    final userProvider = Provider.of<UserProvider>(context,listen: false);


    try
    {
      http.Response res = await http.post(Uri.parse('$uri/api/order'),
      headers: {
          'Content-Type': 'application/json; charset=UTF-8',
                'auth-token': userProvider.user.token,
      },
      body: jsonEncode({
        'cart' : userProvider.user.cart,
        'address' : address,
        'totalPrice' : totalAmount,

      }));

      httpErrorHandler(response: res, context: context, onSuccess: (){
        showSnackBar(context, "Your order has been placed successfully");
        UserModel user = userProvider.user.copyWith(
          cart: [],
        );
        userProvider.setUserFromModel(user);
      });
    }

    catch(e)
    {
      showSnackBar(context, e.toString());
    }
  }
}
