import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/event/component/event_main_vertival_list.dart';
import 'package:mosaico/event/provider/event_provider.dart';
import 'package:mosaico/friend/component/friend_card.dart';

class FriendScreen extends ConsumerWidget {
  static String get routeName => "friend";

  const FriendScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventsRandomProvider(5));

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '내 친구 활동'),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return FriendCard();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 16.0);
                },
                itemCount: 10,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 10.0,
              color: MyColor.lightGrey,
            ),
          ),
          const SliverToBoxAdapter(child: const SizedBox(height: 40.0)),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                '친구가 참여한 이벤트',
                style: MyTextStyle.bodyTitleMedium,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: EventMainVerticalList(events: events),
          ),
        ],
      ),
    );
  }
}
