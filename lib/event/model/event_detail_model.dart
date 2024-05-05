import 'package:mosaico/event/model/event_model.dart';
import 'package:mosaico/event/model/rating_model.dart';

class EventDetailModel extends EventModel {
  final String detail;
  final String condition;
  final List<int> graphData;
  final List<RatingModel> ratings;

  EventDetailModel({
    required super.id,
    required super.title,
    required super.imagePath,
    required super.tags,
    required super.startAt,
    required super.endAt,
    required super.rating,
    required super.participants,
    required super.isParticipation,
    required super.isLike,
    required super.category,
    required this.detail,
    required this.condition,
    required this.graphData,
    required this.ratings,
  });
}
