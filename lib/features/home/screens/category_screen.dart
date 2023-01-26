import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/product_details/screens/product_detail_screen.dart';
import 'package:amazon_clone/shared/widgets/loader.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../../../models/product.dart';

class CategoryDealScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealScreen({super.key, required this.category});

  @override
  State<CategoryDealScreen> createState() => _CategoryDealScreenState();
}

class _CategoryDealScreenState extends State<CategoryDealScreen> {
  List<Product>? products;
  final HomeServices homeService = HomeServices();


  @override
  void initState() {
    
    getCategoryProducts();
  }

  getCategoryProducts() async{
    products = await homeService.fetchCategoryProducts(context: context, category: widget.category);
    setState(() {
      
    });
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: _buildAppBar(),
      body: products == null ?  const Loader()  : Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
            alignment: Alignment.topLeft,
            child: Text('Keep shopping for ${widget.category}',
            style: const TextStyle(
              fontSize: 22
            ),),
          ),
          SizedBox(
            height: 170,
            child: GridView.builder(
              itemCount: products!.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.4,
              mainAxisSpacing: 10,

            ), itemBuilder: (context, index) {
              final product = products![index]; 
              // print(product);
                  return GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, ProductDetailsScreen.routeName,arguments: product);
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 130,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12,width: 0.5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.network(product.images[0]),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
            }),  
          )
        ],
      ),
    );
  }



   _buildAppBar() => 
     PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:const  BoxDecoration(
              gradient: GlobalVariable.appBarGradient
            ),
          ),
          title: Text(widget.category,
          style: const TextStyle(color: Colors.black),
          )
        ),
        
      );
}