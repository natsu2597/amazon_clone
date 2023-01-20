

import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/accounts/widgets/single_products.dart';
import 'package:flutter/material.dart';

class OrdersUser extends StatefulWidget {
  const OrdersUser({super.key});

  @override
  State<OrdersUser> createState() => _OrdersUserState();
}

class _OrdersUserState extends State<OrdersUser> {

  List list = [
      'https://images.unsplash.com/photo-1661956602868-6ae368943878?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://media.istockphoto.com/id/1440629448/photo/cropped-shot-businessman-using-smart-phone-while-sitting-at-his-workplace.jpg?s=612x612&w=is&k=20&c=9RmzSe98VyLYGHn_rKy04heD03W9s9j-3Ljgh-LeZxE=',
      'https://www.channelnews.com.au/wp-content/uploads/2016/06/panasonic1-1.jpg',
      'https://images.unsplash.com/photo-1628262465587-ce5b7acdebef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
    ];


  @override
  Widget build(BuildContext context) {
    
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 15),
            child: const Text('Your Orders',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(right: 15),
            child: Text('See all',
                  style: TextStyle(
                    fontSize: 18,
                    color: GlobalVariable.selectedNavBarColor,
                    fontWeight: FontWeight.w300
                  ),
            ),
          ),
        ],
      ),
      Container(
        
        height: 170,
        padding: const EdgeInsets.only(left: 10,top: 10,right: 0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: ((context, index) {
            return SingleProduct(image: list[index]);
          })),
      )
    ],);
  }
}