import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/product_details/screens/product_detail_screen.dart';
import 'package:amazon_clone/features/product_details/services/product_detals_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/shared/widgets/loader.dart';
import 'package:flutter/material.dart';


class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({super.key});

  @override
  State<DealOfTheDay> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  Product? product;
  final HomeServices service = HomeServices();

  @override
  void initState() {
    
    super.initState();
    getDealOfTheDay();
  }


  void getDealOfTheDay() async{
    product = await service.getDealOfTheDay(context: context);
    setState(() {
      
    });
  }

  void navigateToDetailScreen()
  {
    Navigator.pushNamed(context, ProductDetailsScreen.routeName ,arguments: product);
  }


  @override
  Widget build(BuildContext context) {
    return product == null 
      ? const Loader() : product!.name.isEmpty ?
      const SizedBox() : GestureDetector(
        onTap: (){
          navigateToDetailScreen();
        },
        child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10,top: 15),
            child: const Text("Deals of the day",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),
          ),
          Image.network(product!.images[0],height: 200,
          fit: BoxFit.fitHeight,),
          Container(
            padding: const EdgeInsets.only(left: 15),
            alignment: Alignment.topLeft,
            child: Text("\₹ ${product!.price} ",style: const TextStyle(
              fontSize: 20
            ),),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15,top: 5,right: 20),
            child: Text(product!.name,overflow: TextOverflow.ellipsis ,),
          ),
          const SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: product!.images.map((e) => 
              Image.network(e,
              fit: BoxFit.fitWidth,
              width: 100,
              height: 100,
                ),
              ).toList()
                
                // Image.network("https://m.media-amazon.com/images/I/81S8s6ecDUL._SX679_.jpg",fit: BoxFit.fitWidth,width: 100,height: 100,),
                // Image.network("https://m.media-amazon.com/images/I/81qz3kruOCL._SY879_.jpg",fit: BoxFit.fitWidth,width: 100,height: 100,),
                // Image.network("https://m.media-amazon.com/images/I/41ivqlznE4L._SX679_.jpg",fit: BoxFit.fitWidth,width: 100,height: 100,),
              ,
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
          ),
      );
  }
}