import 'package:amazon_clone/features/accounts/widgets/single_products.dart';
import 'package:amazon_clone/features/admin/screens/add_products_screen.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/shared/widgets/loader.dart';
import 'package:flutter/material.dart';


class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async{
    products =  await adminServices.fetchAllProducts(context);
    setState(() {
      
    });
  }

  void deleteProduct(Product product, int index)
  {
    AdminServices().deleteProduct(context: context, product: product, onSuccess: (){
        products!.removeAt(index);
        setState(() {
          
        });
    });
  }

  void navigateToAddProductSCreen(){
    Navigator.pushNamed(context, AddProductsScreen.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return products == null ? const Loader() : Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
        itemCount: products!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
        
        itemBuilder: ((context, index) {
        final productData = products![index];
        return Column(
          children: [
            SizedBox(
              height: 140,
              child: SingleProduct(image: productData.images[0],),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Text(productData.name,overflow: TextOverflow.ellipsis,
                maxLines:2,)),
                IconButton(icon:const Icon(Icons.delete_outline),onPressed: (){
                  deleteProduct(productData, index);
                },)
              ],
            )
          ],
        );
      
      
      })),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: navigateToAddProductSCreen,
        tooltip: "Add a Product",
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}