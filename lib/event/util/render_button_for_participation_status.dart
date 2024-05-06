import 'package:flutter/material.dart';
import 'package:mosaico/common/component/default_button.dart';
import 'package:mosaico/event/model/event_model.dart';

Widget renderButtonForParticipationStatus({
  required BuildContext context,
  required ParticipationStatus participationStatus,
}) {
  switch (participationStatus) {
    case ParticipationStatus.expected:
      return ContainerButton(
        onPressed: null,
        child: Text(participationStatus.label),
      );
    case ParticipationStatus.ready:
      return SecondaryButton(
        onPressed: () {},
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
  }
}
