import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/const/image_path.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/common/utils/data_utils.dart';
import 'package:mosaico/event/component/event_main_vertival_list.dart';
import 'package:mosaico/event/model/event_model.dart';
import 'package:mosaico/event/provider/event_provider.dart';
import 'package:mosaico/notification/view/notification_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EventScreen extends ConsumerWidget {
  static String get routeName => "event";

  const EventScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventsProvider);

    return DefaultLayout(
      appbar: DefaultAppBar(
        centerTitle: false,
        titleWidget: Row(
          children: [
            Image.asset(
              ImagePath.logo,
              height: 28.0,
              width: 28.0,
            ),
            const SizedBox(width: 4.0),
            const Text('모자이코', style: MyTextStyle.bodyTitleBold,)
          ],
        ),
        title: '',
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                context.pushNamed(NotificationScreen.routeName);
              },
              icon: PhosphorIcon(
                PhosphorIcons.bell(),
              ),
              iconSize: 28.0,
            ),
          ),
        ],
      ),
      child: EventMainVerticalList(events: DataUtils.getRandomShuffledList<EventModel>(events)),
    );
  }
}