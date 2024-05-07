import 'package:flutter/material.dart';
import 'package:mosaico/common/const/colors.dart';

class FriendCard extends StatelessWidget {
  const FriendCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: MyColor.darkGrey,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text('afds'),
    );
  }
}
