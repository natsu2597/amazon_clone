import 'package:flutter/material.dart';


class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({super.key});

  @override
  State<DealOfTheDay> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10,top: 15),
          child: const Text("Deals of the day",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),
        ),
        Image.network("https://m.media-amazon.com/images/I/81yf3A7zi3L._SX679_.jpg",height: 200,
        fit: BoxFit.fitHeight,),
        Container(
          padding: const EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child: Text("\₹ 11,990 ",style: TextStyle(
            fontSize: 20
          ),),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15,top: 5,right: 20),
          child: const Text("Jbl Professional 1 Series 104-Bt Compact Desktop Reference Woofer Monitors With Bluetooth, Black, Sold As Pair",overflow: TextOverflow.ellipsis ,),
        ),
        SizedBox(height: 10,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network("https://m.media-amazon.com/images/I/81i9nO-7U7L._SX679_.jpg",fit: BoxFit.fitWidth,width: 100,height: 100,),
              Image.network("https://m.media-amazon.com/images/I/81S8s6ecDUL._SX679_.jpg",fit: BoxFit.fitWidth,width: 100,height: 100,),
              Image.network("https://m.media-amazon.com/images/I/81qz3kruOCL._SY879_.jpg",fit: BoxFit.fitWidth,width: 100,height: 100,),
              Image.network("https://m.media-amazon.com/images/I/41ivqlznE4L._SX679_.jpg",fit: BoxFit.fitWidth,width: 100,height: 100,),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15
          ).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text("See all deals",style: TextStyle(color: Colors.cyan[700]),),
        )
      ],
    );
  }
}