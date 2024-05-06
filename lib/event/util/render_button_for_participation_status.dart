import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/component/default_button.dart';
import 'package:mosaico/event/model/event_model.dart';
import 'package:mosaico/event/view/event_rating_screen.dart';
import 'package:mosaico/event/view/participation_certification_screen.dart';

Widget renderButtonForParticipationStatus({
  required BuildContext context,
  required EventModel event,
}) {
  final participationStatus =
      ParticipationStatus.getParticipationStatusFromEvent(event: event);

  switch (participationStatus) {
    case ParticipationStatus.expected:
      return ContainerButton(
        onPressed: null,
        child: Text(participationStatus.label),
      );
    case ParticipationStatus.ready:
      return SecondaryButton(
        onPressed: () {
          context.pushNamed(
            ParticipationCertificationScreen.routeName,
            pathParameters: {'id': event.id},
          );
        },
        child: Text(participationStatus.label),
      );
    case ParticipationStatus.done:
      return ContainerButton(
        onPressed: null,
        child: Text(participationStatus.label),
      );
    case ParticipationStatus.expired:
      return ContainerButton(
        onPressed: null,
        child: Text(participationStatus.label),
      );
    case ParticipationStatus.rating:
      return SecondaryButton(
        onPressed: () {
          context.pushNamed(EventRatingScreen.routeName,
            pathParameters: {'id': event.id},
          );
        },
        child: Text(participationStatus.label),
      );
    case ParticipationStatus.ratingDone:
      return ContainerButton(
        onPressed: null,
        child: Text(participationStatus.label),
      );
  }
}
