import 'package:flutter/material.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';

class CategoryScreen extends StatelessWidget {
  static String get routeName => "category";

  final String title;

  const CategoryScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(title: '$title 조회결과'),
      child: Column(
        children: [
          Text('safd'),
        ],
      ),
    );
  }
}
