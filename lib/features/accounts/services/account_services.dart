import 'dart:convert';

import 'package:amazon_clone/constants/error_handler.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/global_variables.dart';
import '../../../models/order.dart';

class AccountServices{
  Future<List<OrderModel>> fetchUserOrders({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context,listen: false);
    List<OrderModel> orderList = [];

    try{
      http.Response res = await http.get(Uri.parse('$uri/api/order/my'),
      headers: {
            'Content-Type': 'application/json; charset=UTF-8',
                'auth-token': userProvider.user.token,
      });

      httpErrorHandler(response: res, context: context, onSuccess: (){
        for(int i = 0; i < jsonDecode(res.body).length ; i++)
        {
          orderList.add(OrderModel.fromJson(jsonEncode(jsonDecode(res.body)[i])));
        }
      });
    }

    catch(e)
    {
      showSnackBar(context, e.toString());
    }
    return orderList;
  }


  void logout(BuildContext context) async{
    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString('auth-token', '');
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(context, AuthScreen.routeName, (route) => false);
    }

    catch(e){
      showSnackBar(context, e.toString());
    }
  }
}