import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/search/services/search_services.dart';
import 'package:amazon_clone/features/search/widget/search_product.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/shared/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';


class SearchScreen extends StatefulWidget {
  static const String routeName = "/search-screen";
  final String query;
  const SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  final SearchServices search = SearchServices();
  @override
  void initState() {
    
    super.initState();
    searchProducts();
  }

     void navigateToSearchScreen(String query){
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }



    searchProducts() async {
      products = await search.searchProducts(context: context, query: widget.query);
      setState(() {
        
      });
    }

  @override
  Widget build(BuildContext context) {
    return 
          Scaffold(
      appBar: _buildAppBar(),
      body: products == null ? const Loader() : Column(
        children: [
          const AddressBox(),
          const SizedBox(height: 10,),
          Expanded(child: ListView.builder(
          itemCount: products!.length,
          itemBuilder: (context, index){
            return SearchedProduct(product: products![index]);
          }))

        ],
      ),
    );
  }



   _buildAppBar() => 
     PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariable.appBarGradient
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15,),
                  
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: (){

                          },
                          child: const Padding(padding: EdgeInsets.only(
                            left: 6
                          ),
                          child: Icon(Icons.search,color: Colors.black,size: 23,),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide: BorderSide.none
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide: BorderSide(color: Colors.black38,width: 1)
                        ),
                        hintText: 'Search Amazon.in',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17
                        )
                      ),
                      
                    ),
                  ),
                ),
              ),
              Container(
                
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.mic,color: Colors.black,size: 25,),
              )
              
            ],
          ),
        ),
        
      );
}