import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/event/model/rating_model.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RatingModalBottomSheet extends ConsumerWidget {
  static String get routeName => "rating_modal";

  final RatingModel rating;

  const RatingModalBottomSheet({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 300.0,
      decoration: const BoxDecoration(
        color: MyColor.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '',
                  style: MyTextStyle.bigTitleBold,
                ),
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: PhosphorIcon(PhosphorIcons.x()),
                  iconSize: 32.0,
                )
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      rating.user.profileImage,
                      height: 64.0,
                      width: 64.0,
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      rating.user.name,
                      style: MyTextStyle.bigTitleRegular,
                    ),
                  ],
                ),
                const SizedBox(width: 12.0),
                Row(
                  children: [
                    PhosphorIcon(
                      PhosphorIcons.star(PhosphorIconsStyle.fill),
                      size: 32.0,
                      color: MyColor.secondary,
                    ),
                    const SizedBox(width: 6.0),
                    Text(
                      rating.score.toString(),
                      style: MyTextStyle.bigTitleRegular.copyWith(
                        color: MyColor.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              rating.content,
              style: MyTextStyle.descriptionRegular,
            ),
          ],
        ),
      ),
    );
  }
}
