import 'package:mosaico/event/model/event_model.dart';

class EventDetailModel extends EventModel {
  final String detail;
  final String condition;

  EventDetailModel({
    required super.id,
    required super.title,
    required super.imagePath,
    required super.tags,
    required super.startAt,
    required super.endAt,
    required super.ratings,
    required super.totalRatingPoint,
    required super.isParticipation,
    required super.isRatingDone,
    required super.isLike,
    required super.category,
    required super.graphData,
    required super.detailImages,
    required this.detail,
    required this.condition,
  });
}
