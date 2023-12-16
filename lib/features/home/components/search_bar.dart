import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
