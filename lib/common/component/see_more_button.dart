import 'package:flutter/material.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SeeMoreButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SeeMoreButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: MyColor.white,
        height: 24.0,
        child: Row(
          children: [
            Text(
              title,
              style: MyTextStyle.descriptionRegular.copyWith(
                color: MyColor.darkGrey,
              ),
            ),
            PhosphorIcon(
              PhosphorIcons.caretRight(PhosphorIconsStyle.bold),
              size: 16.0,
              color: MyColor.darkGrey,
            ),
          ],
        ),
      ),
    );
  }
}
