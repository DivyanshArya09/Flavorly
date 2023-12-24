import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/features/home/presentation/widgets/carousel_item.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CarouselSlider.builder(
      itemCount: 4,
      itemBuilder: (context, index, realIndex) {
        return const CarouselItem();
      },
      options: CarouselOptions(
        height: size.height * .25,
        enlargeCenterPage: true,
        enlargeFactor: .15,
        autoPlay: true,
      ),
    );
  }
}
