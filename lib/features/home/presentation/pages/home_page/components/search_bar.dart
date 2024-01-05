import 'package:flutter/material.dart';
import 'package:recipe_app/config/utils/responsive.dart';

class CustomSearchBar extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
  const CustomSearchBar(
      {super.key, required this.text, this.controller, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.isMobile(context) ? double.infinity : 500,
      child: TextFormField(
        controller: controller,
        onFieldSubmitted: onSubmitted,
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
