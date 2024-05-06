import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/component/default_button.dart';
import 'package:mosaico/event/model/event_model.dart';
import 'package:mosaico/event/view/participation_certification_screen.dart';

Widget renderButtonForParticipationStatus({
  required BuildContext context,
  required ParticipationStatus participationStatus,
  required String eventId,
}) {
  switch (participationStatus) {
    case ParticipationStatus.expected:
      return ContainerButton(
        onPressed: null,
        child: Text(participationStatus.label),
      );
    case ParticipationStatus.ready:
      return SecondaryButton(
        onPressed: () {
          context.pushNamed(ParticipationCertificationScreen.routeName,
              pathParameters: {
                'id': eventId,
              });
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
        onPressed: () {},
        child: Text(participationStatus.label),
      );
    case ParticipationStatus.ratingDone:
      return ContainerButton(
        onPressed: null,
        child: Text(participationStatus.label),
      );
  }
}
