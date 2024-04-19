import 'package:flutter/material.dart';
import 'package:Flavorly/features/home/presentation/widgets/cusine_tile.dart';

class CusinesList extends StatelessWidget {
  const CusinesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (_, index) => index < 9
          ? const CusineTile()
          : TextButton(onPressed: () {}, child: const Text('More Cusines ?')),
    );
  }
}
