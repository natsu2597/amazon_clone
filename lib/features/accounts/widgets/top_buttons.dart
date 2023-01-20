


import 'package:amazon_clone/features/accounts/widgets/account_btn.dart';
import 'package:flutter/material.dart';

class TopButton extends StatefulWidget {
  const TopButton({super.key});

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: "Your orders", onTap: (){}),
            AccountButton(text: "Turn Seller", onTap: (){}),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            AccountButton(text: "Log Out", onTap: (){}),
            AccountButton(text: "Your WishList", onTap: (){}),
          ],
        )
      ],
    );
  }
}