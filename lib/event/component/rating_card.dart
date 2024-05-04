import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/event/model/rating_model.dart';
import 'package:mosaico/user/model/user_model.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RatingCard extends StatelessWidget {
  final String id;
  final UserModel user;
  final int score;
  final String content;

  const RatingCard({
    super.key,
    required this.id,
    required this.user,
    required this.score,
    required this.content,
  });

  factory RatingCard.fromModel({
    required RatingModel rating,
  }) {
    return RatingCard(
      id: rating.id,
      user: rating.user,
      score: rating.score,
      content: rating.content,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: MyColor.middleGrey,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      width: 214,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      user.profileImage,
                      height: 48.0,
                      width: 60.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: MyTextStyle.descriptionRegular,
                      ),
                      Row(
                        children: [
                          PhosphorIcon(
                            PhosphorIcons.star(PhosphorIconsStyle.fill),
                            color: MyColor.secondary,
                            size: 20.0,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            score.toString(),
                            style: MyTextStyle.minimumRegular.copyWith(
                              color: MyColor.secondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
