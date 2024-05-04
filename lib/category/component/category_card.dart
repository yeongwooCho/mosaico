import 'package:flutter/material.dart';
import 'package:mosaico/common/const/colors.dart';

class CategoryCard extends StatelessWidget {
  final String title;

  const CategoryCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColor.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        child: Row(
          children: [
            Text(title),
          ],
        ),
      ),
    );
  }
}
