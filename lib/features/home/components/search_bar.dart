import 'package:flutter/material.dart';
import 'package:recipe_app/config/utils/responsive.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.isMobile(context) ? double.infinity : 500,
      child: TextFormField(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search any recipes',
          border: OutlineInputBorder(
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
