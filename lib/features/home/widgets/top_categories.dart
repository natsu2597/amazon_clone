import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/screens/category_screen.dart';
import 'package:flutter/material.dart';


class TopCategory extends StatelessWidget {
  const TopCategory({super.key});

  void goToCategoryPage(String category, BuildContext context)
  {
    Navigator.pushNamed(context, CategoryDealScreen.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: 75,
        itemCount: GlobalVariable.categoryImages.length ,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap:  () => goToCategoryPage(GlobalVariable.categoryImages[index]['title']!,context),
            child: Column(
              children: [
                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(GlobalVariable.categoryImages[index]['image']!,
                    fit: BoxFit.cover,
                    height: 40,
                    width: 40,),
                  ),
                ),
                const SizedBox(height: 5,),
                Text(GlobalVariable.categoryImages[index]['title']!,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400
                ),
                )
              ],
            ),
          );
      }),
      
      ),
    );
  }
}