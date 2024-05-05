import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/component/horizontal_button_list.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/event/component/event_card.dart';
import 'package:mosaico/event/model/event_model.dart';
import 'package:mosaico/event/provider/event_provider.dart';
import 'package:mosaico/event/view/event_detail_screen.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  static String get routeName => "category";

  final String title;

  const CategoryScreen({
    super.key,
    required this.title,
  });

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  List<EventModel> renderEvents = [];
  List<EventModel> readyEvents = [];
  List<EventModel> expectedEvents = [];

  @override
  Widget build(BuildContext context) {
    final events = ref.watch(eventsProvider);
    readyEvents = events
        .where((element) =>
            element.participationStatus == ParticipationStatus.ready ||
            element.participationStatus == ParticipationStatus.done)
        .toList();
    expectedEvents = events
        .where((element) =>
            element.participationStatus == ParticipationStatus.expected)
        .toList();

    renderEvents = readyEvents;

    return DefaultLayout(
      appbar: DefaultAppBar(title: '${widget.title} 조회결과'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: HorizontalButtonList(
              initialSelectedIndex: 1,
              buttons: [
                HorizontalButtonModel(
                  title: '전체',
                  onTap: () {
                    setState(() {
                      renderEvents = events;
                    });
                  },
                ),
                HorizontalButtonModel(
                  title: '진행중',
                  onTap: () {
                    setState(() {
                      renderEvents = readyEvents;
                    });
                  },
                ),
                HorizontalButtonModel(
                  title: '오픈예정',
                  onTap: () {
                    setState(() {
                      renderEvents = expectedEvents;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, bottom: 10.0),
            child: Text(
              '총 ${renderEvents.length} 건',
              style: MyTextStyle.bodyTitleBold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final event = renderEvents[index];

                return GestureDetector(
                  onTap: () {
                    context.goNamed(
                      EventDetailScreen.routeName,
                      pathParameters: {'id': event.id},
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 16.0,
                    ),
                    child: EventCard.fromModel(model: event),
                  ),
                );
              },
              itemCount: renderEvents.length,
            ),
          ),
        ],
      ),
    );
  }
}
