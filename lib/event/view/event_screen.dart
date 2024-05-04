import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/const/image_path.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/event/component/event_card.dart';
import 'package:mosaico/event/provider/event_provider.dart';
import 'package:mosaico/event/view/event_detail_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EventScreen extends ConsumerWidget {
  static String get routeName => "event";

  const EventScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventsProvider);

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '',
        leading: Image.asset(ImagePath.logo),
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: PhosphorIcon(
                PhosphorIcons.bell(),
              ),
              iconSize: 32.0,
            ),
          ),
        ],
      ),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              context.goNamed(EventDetailScreen.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 16.0,
              ),
              child: EventCard.fromModel(model: events[index]),
            ),
          );
        },
        itemCount: events.length,
      ),
    );
  }
}