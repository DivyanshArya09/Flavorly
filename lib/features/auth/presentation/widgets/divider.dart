import 'package:flutter/material.dart';
import 'package:Flavorly/config/constants/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Divider(color: AppColors.darkGrey),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'OR',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          Expanded(
            child: Divider(color: AppColors.darkGrey),
          ),
        ],
      ),
    );
  }
}
