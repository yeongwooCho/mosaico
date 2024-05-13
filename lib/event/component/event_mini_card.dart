import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/event/model/event_model.dart';

class EventMiniCard extends ConsumerWidget {
  final String id;
  final String title;
  final String imagePath;
  final bool isLike;

  const EventMiniCard({
    super.key,
    required this.id,
    required this.title,
    required this.imagePath,
    required this.isLike,
  });

  factory EventMiniCard.fromModel({
    required EventModel model,
  }) {
    return EventMiniCard(
      id: model.id,
      title: model.title,
      imagePath: model.imagePath,
      isLike: model.isLike,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 180.0,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: MyColor.shadow,
            blurRadius: 8.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          color: MyColor.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.fill,
                width: 180.0,
                height: 140.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Text(
                  title,
                  style: MyTextStyle.minimumRegular,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
