import 'package:flutter/material.dart';
import 'package:mosaico/common/const/colors.dart';

class CustomLoadingScreen extends StatelessWidget {
  const CustomLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.barrier,
      body: Center(
        child: Center(
          child: Image.asset(
            'asset/img/logo/logo.png',
            width: 160.0,
            height: 160.0,
          ),
        ),
      ),
    );
  }
}
