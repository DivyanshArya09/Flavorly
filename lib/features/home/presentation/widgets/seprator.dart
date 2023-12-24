import 'package:flutter/material.dart';

class CustomSeperator extends StatelessWidget {
  const CustomSeperator({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .02,
    );
  }
}
