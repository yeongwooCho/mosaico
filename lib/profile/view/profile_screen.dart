import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/component/see_more_button.dart';
import 'package:mosaico/common/component/show/show_component_modal_bottom_sheet.dart';
import 'package:mosaico/common/component/show/show_cupertino_alert.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/image_path.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/event/component/event_mini_card.dart';
import 'package:mosaico/event/model/event_model.dart';
import 'package:mosaico/event/provider/event_provider.dart';
import 'package:mosaico/event/view/event_detail_screen.dart';
import 'package:mosaico/event/view/event_of_like_screen.dart';
import 'package:mosaico/event/view/event_of_participation_screen.dart';
import 'package:mosaico/profile/view/edit_profile_screen.dart';
import 'package:mosaico/user/model/user_model.dart';
import 'package:mosaico/user/provider/user_provider.dart';
import 'package:mosaico/user/view/login_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileScreen extends ConsumerWidget {
  static String get routeName => "profile";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userMeProvider);

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '내 정보',
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                context.pushNamed(EditProfileScreen.routeName);
              },
              icon: PhosphorIcon(
                PhosphorIcons.gear(),
                size: 32.0,
              ),
            ),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            renderProfileTitle(user: user),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                height: 10.0,
                color: MyColor.lightGrey,
              ),
            ),
            _ProfileEventsLists(user: user),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                height: 10.0,
                color: MyColor.lightGrey,
              ),
            ),
            renderIconAndTextButton(
              icon: PhosphorIcon(
                PhosphorIcons.question(),
                size: 28.0,
              ),
              title: '고객센터',
              onTap: () {
                showCustomerCenterModalBottomSheet(context: context);
              },
            ),
            renderIconAndTextButton(
              icon: PhosphorIcon(
                PhosphorIcons.signOut(),
                size: 28.0,
              ),
              title: '로그아웃',
              onTap: () {
                showCupertinoAlert(
                  context: context,
                  titleWidget: const Text('로그아웃 하시겠습니까?'),
                  completeText: '확인',
                  completeFunction: () {
                    context.goNamed(LoginScreen.routeName);
                  },
                  cancelText: '취소',
                  cancelFunction: () {
                    context.pop();
                  },
                );
              },
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }

  Widget renderProfileTitle({
    required UserModel user,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            ImagePath.user,
            height: 72.0,
            width: 72.0,
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${user.name}님 안녕하세요~",
                style: MyTextStyle.bigTitleRegular,
              ),
              const SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '관심 키워드',
                    style: MyTextStyle.bodyRegular,
                  ),
                  const SizedBox(height: 4.0),
                  Wrap(
                    spacing: 4.0,
                    children: [
                      ...user.keywords.map(
                        (e) => Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0, color: MyColor.primary),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 2.0,
                            ),
                            child: Text(
                              e,
                              style: MyTextStyle.minimumRegular.copyWith(
                                color: MyColor.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget renderIconAndTextButton({
    required Widget icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              icon,
              const SizedBox(width: 12.0),
              Text(
                title,
                style: MyTextStyle.bodyTitleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileEventsLists extends ConsumerWidget {
  final UserModel user;

  const _ProfileEventsLists({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsOfParticipation = ref.watch(eventsOfParticipationProvider);
    final eventsOfLike = ref.watch(eventsOfLikeProvider);
    // final isSeeEvents = user.seeList;
    final isSeeEvents = ref.watch(eventsProvider).where((event) {
      return user.seeList.contains(event.id);
    }).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _renderTitle(
            title: '내가 지원한 이벤트',
            rightButton: SeeMoreButton(
              title: '더보기',
              onTap: () {
                context.goNamed(EventOfParticipationScreen.routeName);
              },
            ),
          ),
          eventsOfParticipation.isNotEmpty
              ? _renderHorizontalList(events: eventsOfParticipation)
              : _renderEmptyContainer(),
          const SizedBox(height: 40.0),
          _renderTitle(
            title: '구독(찜)',
            rightButton: SeeMoreButton(
              title: '더보기',
              onTap: () {
                context.goNamed(EventOfLikeScreen.routeName);
              },
            ),
          ),
          eventsOfLike.isNotEmpty
              ? _renderHorizontalList(events: eventsOfLike)
              : _renderEmptyContainer(),
          const SizedBox(height: 40.0),
          _renderTitle(
            title: '최근 본 이벤트',
            rightButton: const SizedBox(
              height: 1.0,
              width: 1.0,
            ),
          ),
          isSeeEvents.isNotEmpty
              ? _renderHorizontalList(events: isSeeEvents.reversed.toList())
              : _renderEmptyContainer(),
        ],
      ),
    );
  }

  Widget _renderHorizontalList({
    required List<EventModel> events,
  }) {
    return SizedBox(
      height: 200.0,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final event = events[index];

          return InkWell(
            onTap: () {
              context.pushNamed(
                EventDetailScreen.routeName,
                pathParameters: {'id': event.id},
              );
            },
            child: EventMiniCard.fromModel(model: events[index]),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            width: 8.0,
            color: MyColor.empty,
          );
        },
        itemCount: events.length,
      ),
    );
  }

  Widget _renderTitle({
    required String title,
    required Widget rightButton,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: MyTextStyle.bodyTitleMedium,
          ),
          rightButton,
        ],
      ),
    );
  }

  Widget _renderEmptyContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: MyColor.middleGrey,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: const Center(
          child: Text(
            '이벤트가 존재하지 않습니다.',
            style: MyTextStyle.descriptionRegular,
          ),
        ),
      ),
    );
  }
}
