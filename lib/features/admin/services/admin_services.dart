import 'dart:convert';
import 'dart:io';

import 'package:amazon_clone/constants/error_handler.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';

class AdminServices{
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images
  }) async{
    final userProvider = Provider.of<UserProvider>(context,listen: false);
    
    try{
      final cloudinary = CloudinaryPublic('do8dmh60d', 'bpqp67hy');
      List<String> imageUrls = [];

      for(int i = 0; i < images.length ; i++)
      {
        CloudinaryResponse res =  await cloudinary.uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrls.add(res.secureUrl);
       
      }
       Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          price: price,
          images: imageUrls,
          category: category
          );
      http.Response res = await http.post(Uri.parse('$uri/admin/add-product'),
      headers: <String,String>{
            'Content-Type' : 'application/json; charset=UTF-8',
            'auth-token' : userProvider.user.token,
            
      },
      body: product.toJson()
      );
      httpErrorHandler(response: res, context: context, onSuccess: (){
        showSnackBar(context, "Product added successfully");
        Navigator.pop(context);
      });
    }
    catch(e){
      print(e);
      showSnackBar(context, e.toString());
    }
  }
  //  Get all Products
  Future<List<Product>> fetchAllProducts(BuildContext context) async{
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> listProducts = [];
    
    
    try{
      http.Response res =  await http.get(Uri.parse('$uri/admin/get-product'),
      headers: {
            
            'Content-Type' : 'application/json; charset=UTF-8',
            'auth-token' : userProvider.user.token,
            
      },
      );
      
      httpErrorHandler(response: res, context: context, onSuccess: (){
          for(num i = 0 ; i < jsonDecode(res.body).length; i++)
          {
            // print("hello");
            listProducts.add(Product.fromJson(
               
                  jsonEncode(jsonDecode(res.body)[i])
                
              ),);
          }

          
          
      });
    }
    
    catch(e)
    {
      showSnackBar(context, e.toString());
      print(e);
    }
    print(listProducts);
    return listProducts;
  }

  void deleteProduct(
      { required BuildContext context,
        required Product product,
        required VoidCallback onSuccess}
      ) async{
        try{
          final userProvider = Provider.of<UserProvider>(context,listen: false);
          http.Response res = await http.post(Uri.parse('$uri/admin/delete-product'),
          headers: {
            
            'Content-Type' : 'application/json; charset=UTF-8',
            'auth-token' : userProvider.user.token,
            
                  },
                  body: jsonEncode({
                    "id" : product.id
                  }));
          httpErrorHandler(response: res, context: context, onSuccess: (){
              onSuccess();
          });

        }
        catch(e){
          showSnackBar(context, e.toString());
      
        }
  }
}