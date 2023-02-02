import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/accounts/services/account_services.dart';
import 'package:amazon_clone/features/accounts/widgets/single_products.dart';
import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/shared/widgets/loader.dart';
import 'package:flutter/material.dart';

class OrdersUser extends StatefulWidget {
  const OrdersUser({super.key});

  @override
  State<OrdersUser> createState() => _OrdersUserState();
}

class _OrdersUserState extends State<OrdersUser> {
  List<OrderModel>? order;
  final AccountServices services = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    order = await services.fetchUserOrders(
      context: context,
    );
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return order == null ? const Loader() : Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                'See all',
                style: TextStyle(
                    fontSize: 18,
                    color: GlobalVariable.selectedNavBarColor,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, top: 10, right: 0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: order!.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, OrderDetailsScreen.routeName);
                  },
                  child: SingleProduct(image: order![index].products[0].images[0]));
              })),
        )
      ],
    );
  }
}
