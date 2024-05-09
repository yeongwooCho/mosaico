import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/event/component/event_main_vertival_list.dart';
import 'package:mosaico/event/provider/event_provider.dart';
import 'package:mosaico/friend/component/friend_card.dart';
import 'package:mosaico/user/provider/user_provider.dart';

class FriendScreen extends ConsumerStatefulWidget {
  static String get routeName => "friend";

  const FriendScreen({super.key});

  @override
  ConsumerState<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends ConsumerState<FriendScreen> {
  @override
  Widget build(BuildContext context) {
    final friends = ref.watch(friendsProvider);
    final selectedFriend = ref.watch(selectedFriendProvider);

    final events = ref.watch(eventsProvider).where((event) {
      return selectedFriend.seeList.contains(event.id);
    }).toList();

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '내 친구 활동'),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 145.0,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final friend = friends[index];
                  return InkWell(
                    onTap: () {
                      ref.read(selectedFriendProvider.notifier).state = friend;
                    },
                    child: FriendCard(
                      friend: friend,
                      isSelected: selectedFriend == friend,
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 8.0);
                },
                itemCount: friends.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 10.0,
              color: MyColor.lightGrey,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
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
            child: events.isNotEmpty
                ? EventMainVerticalList(events: events)
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 8.0),
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: MyColor.middleGrey,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Center(
                        child: Text(
                          '참여한 이벤트가 존재하지 않습니다.',
                          style: MyTextStyle.descriptionRegular,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
