import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidable/hidable.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/event/component/custom_chart.dart';
import 'package:mosaico/event/component/event_card.dart';
import 'package:mosaico/event/component/rating_card.dart';
import 'package:mosaico/event/model/event_detail_model.dart';
import 'package:mosaico/event/model/event_model.dart';
import 'package:mosaico/event/model/rating_model.dart';
import 'package:mosaico/event/provider/event_provider.dart';
import 'package:mosaico/event/util/render_button_for_participation_status.dart';

class EventDetailScreen extends ConsumerStatefulWidget {
  static String get routeName => "event_detail";
  final String id;

  const EventDetailScreen({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends ConsumerState<EventDetailScreen> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final safeTopPadding = MediaQuery.of(context).padding.top;

    final event = ref.watch(eventDetailProvider(widget.id)) as EventDetailModel;

    return DefaultLayout(
      appbar: Hidable(
        controller: controller,
        preferredWidgetSize:
            Size.fromHeight(DefaultAppBar.defaultAppBarHeight + safeTopPadding),
        child: const DefaultAppBar(title: '모자익 상세'),
      ),
      bottomNavigationBar: Hidable(
        controller: controller,
        preferredWidgetSize: Size.fromHeight(78),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 8.0, bottom: 20.0, right: 24.0, left: 24.0),
          child: Row(
            children: [
              Expanded(
                child: renderButtonForParticipationStatus(
                  context: context,
                  participationStatus: event.participationStatus,
                  eventId: event.id,
                ),
              ),
            ],
          ),
        ),
      ),
      child: CustomScrollView(
        controller: controller,
        slivers: [
          renderEventCard(event: event),
          renderDescription(
              title: '이벤트 내용',
              description:
                  '동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 '),
          renderDescription(
              title: '참여 조건',
              description:
                  '동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 동해물과 백두산이 마르고 '),
          renderChart(data: event.graphData),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                color: MyColor.lightGrey,
                height: 10.0,
              ),
            ),
          ),
          renderRatings(ratings: event.ratings),
        ],
      ),
    );
  }

  SliverPadding renderEventCard({
    required EventModel event,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 16.0,
      ),
      sliver: SliverToBoxAdapter(
        child: EventCard.fromModel(model: event),
      ),
    );
  }

  SliverPadding renderDescription({
    required String title,
    required String description,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        top: 40.0,
        right: 24.0,
        left: 24.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: MyTextStyle.bodyTitleMedium,
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: MyTextStyle.descriptionRegular,
            ),
          ],
        ),
      ),
    );
  }

  SliverPadding renderChart({required List<int> data}) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        top: 40.0,
        right: 24.0,
        left: 24.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '이벤트 참여인원 그래프',
              style: MyTextStyle.bodyTitleMedium,
            ),
            const SizedBox(height: 8.0),
            CustomChart(
              height: 200.0,
              chartData: data,
              dividerLineColor: MyColor.middleGrey,
              borderLineColor: MyColor.darkGrey,
              backgroundColor: MyColor.lightGrey,
              gradientColors: const [
                Color(0xffFF9A85),
                Color(0xffFF5A36),
              ],
              textColor: MyColor.text,
              axisColor: MyColor.text,
              sideTitle: '참여 인원',
              bottomTitle: '이벤트 지속 시간',
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter renderRatings({
    required List<RatingModel> ratings,
  }) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '참여후기',
                  style: MyTextStyle.bodyTitleMedium,
                ),
                Text(
                  '${ratings.length} 건',
                  style: MyTextStyle.bodyTitleMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 140.0,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final rating = ratings[index];
                return RatingCard.fromModel(rating: rating);
              },
              itemCount: ratings.length,
              separatorBuilder: (_, index) {
                return const SizedBox(width: 8.0);
              },
            ),
          ),
          const SizedBox(height: 60.0),
        ],
      ),
    );
  }
}
