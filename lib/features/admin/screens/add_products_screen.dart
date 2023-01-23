import 'dart:io';

import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/shared/widgets/custom_button.dart';
import 'package:amazon_clone/shared/widgets/custom_text_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';



class AddProductsScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductsScreen({super.key});

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {

  final TextEditingController prodNameController = TextEditingController();
  final TextEditingController prodDescController = TextEditingController();
  final TextEditingController prodPriceController = TextEditingController();
  final TextEditingController prodQuantityController = TextEditingController();
  final AdminServices adminServices = AdminServices();
  String category = "Mobiles";
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    
    super.dispose();
    prodNameController.dispose();
    prodDescController.dispose();
    prodPriceController.dispose();
    prodQuantityController.dispose();
  }

  

  List<String> prodCategory = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  void sellProduct(){
    if(_addProductFormKey.currentState!.validate() && images.isNotEmpty)
    {
      adminServices.sellProduct(context: context, name: prodNameController.text, description: prodDescController.text, price: double.parse(prodPriceController.text), quantity: double.parse(prodQuantityController.text), category: category, images: images);
    }
  }

  void selectImages() async{
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                images.isNotEmpty ? 
                CarouselSlider(items: images.map((e) {
                  return Builder(
                    builder: (BuildContext context) => Image.file(e,fit: BoxFit.cover,height: 200),
      );
    }).toList(), options: CarouselOptions(
      viewportFraction: 1,
      height: 200,
      
    ))
                :
                GestureDetector(
                  onTap: selectImages,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10,4],
                    strokeCap: StrokeCap.round,
                    child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.folder_open,size: 40,),
                        const SizedBox(height: 15,),
                        Text("Select Product Images",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400]
                        ),)
                      ],
                    ),
                  ),
                  ),
                ),
                const SizedBox(height: 30,),
                CustomTextField(controller: prodNameController, hintText: "Product Name",),
                const SizedBox(height: 10,),
                CustomTextField(controller: prodDescController, hintText: "Description",maxLines: 5,),
                const SizedBox(height: 10,),
                CustomTextField(controller: prodPriceController, hintText: "Price",),
                const SizedBox(height: 10,),
                CustomTextField(controller: prodQuantityController, hintText: "Quantity",),
                SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: prodCategory.map((String item){
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item));
                    }).toList(),
                    onChanged: (String? val){
                      setState(() {
                        category = val!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10,),
                CustomButton(text: "Save", onTap: (){
                  sellProduct();
                },
                fontSize: 17,)

              ],
            ),
          ),
        ),
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
          title: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 5,right: 10),
            child: const Text("Add Products",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.black),),
          )
        ),
      );
}