import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/accounts/widgets/appbar_header.dart';
import 'package:amazon_clone/features/accounts/widgets/orders.dart';
import 'package:amazon_clone/features/accounts/widgets/top_buttons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariable.appBarGradient
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset('assets/images/amazon_in.png',width: 120,height: 45,color: Colors.black,),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children:const [
                    Padding(padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(Icons.search)
                  ],
                ),
              )
            ],
          ),
        ),
        
      ),
      body: Column(
        children:const [
          AppBarHeader(),
          SizedBox(height: 10,),
          TopButton(),
          SizedBox(height: 20,),
          OrdersUser()

        ],
      ),
    );
  }
}