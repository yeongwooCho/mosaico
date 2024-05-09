import 'package:mosaico/event/model/rating_model.dart';

enum ParticipationStatus {
  // 시작 일이 되지 않았을 때
  expected('오픈예정'),
  // 진행 중인데 참여 하지 않았을 때
  ready('참여하기'),
  // 진행 중인데 참여 했을 때
  done('참여완료'),
  // 끝났는데 참여 안 했을 때
  expired('종료'),
  // 끝났는데 참여 했을 때
  rating('후기 작성'),
  // 끝났고 참여 했고 후기까지 작성
  ratingDone('후기 작성 완료');

  const ParticipationStatus(this.label);

  final String label;

  static ParticipationStatus getParticipationStatus({
    required DateTime startAt,
    required DateTime endAt,
    required bool isParticipation,
    required bool isRatingDone,
  }) {
    final now = DateTime.now();
    final nowDate = DateTime(now.year, now.month, now.day);

    if (nowDate.isBefore(startAt) && now.isBefore(endAt)) {
      return ParticipationStatus.expected;
    } else if (nowDate.isAfter(startAt) &&
        now.isBefore(endAt) &&
        !isParticipation) {
      return ParticipationStatus.ready;
    } else if (nowDate.isAfter(startAt) &&
        now.isBefore(endAt) &&
        isParticipation) {
      return ParticipationStatus.done;
    } else if (nowDate.isAfter(startAt) &&
        now.isAfter(endAt) &&
        !isParticipation) {
      return ParticipationStatus.expired;
    } else if (nowDate.isAfter(startAt) &&
        now.isAfter(endAt) &&
        isParticipation &&
        isRatingDone) {
      return ParticipationStatus.ratingDone;
    } else {
      return ParticipationStatus.rating;
    }
  }

  static ParticipationStatus getParticipationStatusFromEvent({
    required EventModel event,
  }) {
    final now = DateTime.now();
    final nowDate = DateTime(now.year, now.month, now.day);
    final startAt = event.startAt;
    final endAt = event.endAt;
    final isParticipation = event.isParticipation;
    final isRatingDone = event.ratings.isNotEmpty;

    if (nowDate.isBefore(startAt) && now.isBefore(endAt)) {
      return ParticipationStatus.expected;
    } else if (nowDate.isAfter(startAt) &&
        now.isBefore(endAt) &&
        !isParticipation) {
      return ParticipationStatus.ready;
    } else if (nowDate.isAfter(startAt) &&
        now.isBefore(endAt) &&
        isParticipation) {
      return ParticipationStatus.done;
    } else if (nowDate.isAfter(startAt) &&
        now.isAfter(endAt) &&
        !isParticipation) {
      return ParticipationStatus.expired;
    } else if (nowDate.isAfter(startAt) &&
        now.isAfter(endAt) &&
        isParticipation &&
        isRatingDone) {
      return ParticipationStatus.ratingDone;
    } else {
      return ParticipationStatus.rating;
    }
  }
}

class EventModel {
  final String id;
  final String title;
  final String imagePath;
  final List<String> tags;
  final DateTime startAt;
  final DateTime endAt;
  final List<RatingModel> ratings;
  final double totalRatingPoint;
  final bool isParticipation;
  final bool isLike;
  final String category;
  final List<int> graphData;

  EventModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.tags,
    required this.startAt,
    required this.endAt,
    required this.ratings,
    required this.totalRatingPoint,
    required this.isParticipation,
    required this.isLike,
    required this.category,
    required this.graphData,
  });

  EventModel copyWith({
    String? id,
    String? title,
    String? imagePath,
    List<String>? tags,
    DateTime? startAt,
    DateTime? endAt,
    List<RatingModel>? ratings,
    double? totalRatingPoint,
    int? participants,
    bool? isParticipation,
    bool? isLike,
    String? category,
    List<int>? graphData,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
      tags: tags ?? this.tags,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      ratings: ratings ?? this.ratings,
      totalRatingPoint: totalRatingPoint ?? this.totalRatingPoint,
      isParticipation: isParticipation ?? this.isParticipation,
      isLike: isLike ?? this.isLike,
      category: category ?? this.category,
      graphData: graphData ?? this.graphData,
    );
  }
}
