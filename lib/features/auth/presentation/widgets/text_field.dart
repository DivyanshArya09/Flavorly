import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Icon icon;
  final IconButton? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.icon,
    this.suffixIcon,
    this.onSuffixIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: icon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
