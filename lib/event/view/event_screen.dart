import 'package:flutter/material.dart';
import 'package:mosaico/common/const/image_path.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/event/component/event_card.dart';
import 'package:mosaico/event/model/event_model.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EventScreen extends StatelessWidget {
  static String get routeName => "event";

  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '로고',
        centerTitle: false,
        action: [
          IconButton(
            onPressed: () {},
            icon: PhosphorIcon(
              PhosphorIcons.bell(),
            ),
          ),
        ],
      ),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 16.0,
            ),
            child: EventCard.fromModel(
              model: EventModel(
                title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
                imagePath: ImagePath.image,
                tags: ['신상품', '세일', '온라인 단독', '사은품'],
                startAt: DateTime(2024, 4, 22),
                endAt: DateTime(2024, 5, 21),
                rating: 4.9,
                participants: 12456,
              ),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}