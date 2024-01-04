import 'package:flutter/material.dart';
import 'package:recipe_app/config/utils/responsive.dart';

class CustomSearchBar extends StatelessWidget {
  final String text;
  const CustomSearchBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.isMobile(context) ? double.infinity : 500,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: const Icon(Icons.search),
          hintText: text,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(300),
            ),
          ),
          // border: InputBorder.none
        ),
      ),
    );
  }
}
