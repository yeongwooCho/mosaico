import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/common/utils/data_utils.dart';
import 'package:mosaico/notification/provider/notification_provider.dart';
import 'package:mosaico/notification/view/notification_detail_screen.dart';

class NotificationScreen extends ConsumerWidget {
  static String get routeName => "notification";

  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '공지사항'),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        itemBuilder: (BuildContext context, int index) {
          final notification = notifications[index];
          return GestureDetector(
            onTap: () {
              context.pushNamed(
                NotificationDetailScreen.routeName,
                pathParameters: {
                  "id": notification.id,
                },
              );
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    notification.title,
                    style: MyTextStyle.bodyTitleMedium,
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    DataUtils.convertDateTimeToDateTimeString(
                      datetime: notification.createAt,
                    ),
                    style: MyTextStyle.bodyRegular.copyWith(
                      color: MyColor.darkGrey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (_, index) {
          return Container(
            height: 1.0,
            width: MediaQuery.of(context).size.width - 148,
            color: MyColor.middleGrey,
          );
        },
        itemCount: notifications.length,
      ),
    );
  }
}
