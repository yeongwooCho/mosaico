import 'package:flutter/material.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/image_path.dart';

class CustomLoadingScreen extends StatelessWidget {
  const CustomLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.barrier,
      body: Center(
        child: Center(
          child: Image.asset(
            ImagePath.logo,
            width: 160.0,
            height: 160.0,
          ),
        ),
      ),
    );
  }
}
