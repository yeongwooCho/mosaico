import 'package:flutter/material.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/user/model/user_model.dart';

class FriendCard extends StatelessWidget {
  final UserModel user;

  const FriendCard({
    super.key,
    required this.user,
  });

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              user.profileImage,
              height: 60.0,
              width: 60.0,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 4.0),
            Text(
              user.name,
              style: MyTextStyle.descriptionRegular,
            ),
          ],
        ),
      ),
    );
  }
}
