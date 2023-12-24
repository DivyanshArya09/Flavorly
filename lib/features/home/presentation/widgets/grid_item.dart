import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 250,
          width: 300,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: const Stack(children: [
            Positioned(
              top: 10,
              right: 10,
              child: Icon(
                Icons.favorite_border_outlined,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
              child: Text(
                'Dish name',
              ),
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child: Text(
                  '30 . mins',
                ))
          ])),
    );
  }
}
