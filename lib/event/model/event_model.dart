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
  rating('후기 작성');

  const ParticipationStatus(this.label);

  final String label;

  static ParticipationStatus getParticipationStatus({
    required DateTime startAt,
    required DateTime endAt,
    required bool isParticipation,
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
  final double rating;
  final int participants;
  final bool isParticipation;
  final bool isLike;
  late ParticipationStatus participationStatus;

  EventModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.tags,
    required this.startAt,
    required this.endAt,
    required this.rating,
    required this.participants,
    required this.isParticipation,
    required this.isLike,
  }) {
    participationStatus = ParticipationStatus.getParticipationStatus(
      startAt: startAt,
      endAt: endAt,
      isParticipation: isParticipation,
    );
  }

  EventModel copyWith({
    String? id,
    String? title,
    String? imagePath,
    List<String>? tags,
    DateTime? startAt,
    DateTime? endAt,
    double? rating,
    int? participants,
    bool? isParticipation,
    bool? isLike,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
      tags: tags ?? this.tags,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      rating: rating ?? this.rating,
      participants: participants ?? this.participants,
      isParticipation: isParticipation ?? this.isParticipation,
      isLike: isLike ?? this.isLike,
    );
  }
}
