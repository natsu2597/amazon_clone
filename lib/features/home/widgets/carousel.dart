import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(items: GlobalVariable.carouselImages.map((e) {
      return Builder(
        builder: (BuildContext context) => Image.network(e,fit: BoxFit.cover,height: 200),
      );
    }).toList(), options: CarouselOptions(
      viewportFraction: 1,
      height: 200,
      
    ));
  }
}

