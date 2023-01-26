

import 'package:amazon_clone/features/product_details/screens/product_detail_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/shared/widgets/stars.dart';
import 'package:flutter/material.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    double totalRating = 0;
    double avgRating = 0.0;
    for(int i = 0 ; i < product.rating!.length; i++)
    {
      totalRating += product.rating![i].rating;
      
    }

    if(totalRating != 0)
    {
      avgRating = totalRating / product.rating!.length;
    }


    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.routeName,arguments: product);
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                product.images[0],
                fit: BoxFit.contain,
                height: 175,
                width: 145,
                ),
                // SizedBox(width: 10,),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: 200,
                      child: Text(product.name,style: const TextStyle(
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16
                      ),
                      maxLines: 2,
                    ),
                      
                    ),
    
                    Container(
                      margin: const EdgeInsets.only(top: 7,left: 20),
                      width: 200,
                      child:  Stars(rating: avgRating ,)
                      
                    ),
                    
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      width: 200,
                      child: Text('\₹ ${product.price.toString()}',style: const TextStyle(
                        color:Colors.black,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold
                      ),
                      maxLines: 4,),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      width: 200,
                      child: Text('Eligible for FREE shipping',style: TextStyle(
                        fontSize: 15
                      ),)
                      
                    ),
    
                     Container(
                      margin: const EdgeInsets.only(left: 10,top: 3),
                      width: 200,
                      child: product.quantity > 0 ? const Text("In Stock",style: TextStyle(color: Colors.teal),)   : const Text("Out of Stock",style: TextStyle(color: Colors.red),)
                      
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}