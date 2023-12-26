import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeltonContainer extends StatelessWidget {
  final double height, width, radius;
  const SkeltonContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 500),
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
