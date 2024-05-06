import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/event/component/event_main_vertival_list.dart';
import 'package:mosaico/event/provider/event_provider.dart';

class EventOfLikeScreen extends ConsumerWidget {
  static String get routeName => "like";

  const EventOfLikeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventsOfLikeProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '구독 리스트'),
      child: EventMainVerticalList(events: events),
    );
  }
}
