import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/utils/data_utils.dart';
import 'package:mosaico/event/model/event_model.dart';
import 'package:mosaico/event/provider/event_provider.dart';
import 'package:mosaico/event/util/render_button_for_participation_status.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EventCard extends ConsumerWidget {
  final String id;
  final String title;
  final String imagePath;
  final List<String> tags;
  final DateTime startAt;
  final DateTime endAt;
  final double rating;
  final int participants;
  final bool isLike;
  final ParticipationStatus participationStatus;

  const EventCard({
    super.key,
    required this.id,
    required this.title,
    required this.imagePath,
    required this.tags,
    required this.startAt,
    required this.endAt,
    required this.rating,
    required this.participants,
    required this.isLike,
    required this.participationStatus,
  });

  factory EventCard.fromModel({
    required EventModel model,
  }) {
    return EventCard(
      id: model.id,
      title: model.title,
      imagePath: model.imagePath,
      tags: model.tags,
      startAt: model.startAt,
      endAt: model.endAt,
      rating: model.totalRatingPoint,
      participants: model.participants,
      isLike: model.isLike,
      participationStatus: model.participationStatus,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: MyColor.shadow,
            blurRadius: 8.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
                InkWell(
                  onTap: () {
                    ref.read(eventsProvider.notifier).updateLike(id: id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: MyColor.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: isLike
                            ? PhosphorIcon(
                                PhosphorIcons.heart(PhosphorIconsStyle.fill),
                                color: MyColor.primary,
                              )
                            : PhosphorIcon(
                                PhosphorIcons.heart(),
                                color: MyColor.darkGrey,
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: MyColor.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: MyTextStyle.bodyRegular,
                    ),
                    const SizedBox(height: 8.0),
                    _TagContainer(
                      tags: tags,
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _EventDescription(
                          startAt: startAt,
                          endAt: endAt,
                          participants: participants,
                        ),
                        renderButtonForParticipationStatus(
                          context: context,
                          participationStatus: participationStatus,
                          eventId: id,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TagContainer extends StatelessWidget {
  final List<String> tags;

  const _TagContainer({
    super.key,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: tags
          .map((e) => Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: renderTag(title: e),
              ))
          .toList(),
    );
  }

  Widget renderTag({
    required String title,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: MyColor.third,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Text(
          title,
          style: MyTextStyle.minimumRegular.copyWith(
            color: MyColor.third,
          ),
        ),
      ),
    );
  }
}

class _EventDescription extends StatelessWidget {
  final DateTime startAt;
  final DateTime endAt;
  final int participants;

  const _EventDescription({
    super.key,
    required this.startAt,
    required this.endAt,
    required this.participants,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              PhosphorIcon(
                PhosphorIcons.calendar(),
                color: MyColor.darkGrey,
                size: 20.0,
              ),
              const SizedBox(width: 4.0),
              Text(
                '${DataUtils.convertDateTimeToDateString(datetime: startAt)} - ${DataUtils.convertDateTimeToDateString(datetime: endAt)}',
                style: MyTextStyle.minimumRegular.copyWith(
                  color: MyColor.darkGrey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Row(
            children: [
              Row(
                children: [
                  PhosphorIcon(
                    PhosphorIcons.star(PhosphorIconsStyle.fill),
                    color: MyColor.secondary,
                    size: 20.0,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    4.9.toString(),
                    style: MyTextStyle.minimumRegular.copyWith(
                      color: MyColor.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12.0),
              Row(
                children: [
                  PhosphorIcon(
                    PhosphorIcons.user(),
                    color: MyColor.secondary,
                    size: 20.0,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    '${DataUtils.convertPriceToMoneyString(price: participants)}명',
                    style: MyTextStyle.minimumRegular.copyWith(
                      color: MyColor.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
