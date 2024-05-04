import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/event/component/event_card.dart';
import 'package:mosaico/event/provider/event_provider.dart';

class EventDetailScreen extends ConsumerWidget {
  static String get routeName => "event_detail";

  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = GoRouterState.of(context).pathParameters['id']!;
    final event = ref.watch(eventDetailProvider(id));

    return DefaultLayout(
      appbar: DefaultAppBar(title: '모자익 상세'),
      child: SingleChildScrollView(

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 16.0,
              ),
              child: EventCard.fromModel(model: event),
            ),
            Text('afsd'),
            Text('afsd'),
            Text('afsd'),
          ],
        ),
      ),
    );
  }
}
