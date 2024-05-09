import 'package:flutter/material.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/user/model/user_model.dart';

class FriendCard extends StatelessWidget {
  final UserModel friend;
  final bool isSelected;

  const FriendCard({
    super.key,
    required this.friend,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: isSelected ? MyColor.primary : MyColor.empty,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              friend.profileImage,
              height: 60.0,
              width: 60.0,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 4.0),
            Text(
              friend.name,
              style: MyTextStyle.descriptionRegular,
            ),
          ],
        ),
      ),
    );
  }
}
