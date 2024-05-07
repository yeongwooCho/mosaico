import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/event/component/event_card.dart';
import 'package:mosaico/event/model/event_model.dart';
import 'package:mosaico/event/view/event_detail_screen.dart';

class EventMainVerticalList extends StatelessWidget {
  final List<EventModel> events;

  const EventMainVerticalList({
    super.key,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final event = events[index];

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
      itemCount: events.length,
    );
  }
}
