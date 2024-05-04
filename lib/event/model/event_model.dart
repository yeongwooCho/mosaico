class EventModel {
  final String id;
  final String title;
  final String imagePath;
  final List<String> tags;
  final DateTime startAt;
  final DateTime endAt;
  final double rating;
  final int participants;
  final bool isLike;

  EventModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.tags,
    required this.startAt,
    required this.endAt,
    required this.rating,
    required this.participants,
    required this.isLike,
  });

  EventModel copyWith({
    String? id,
    String? title,
    String? imagePath,
    List<String>? tags,
    DateTime? startAt,
    DateTime? endAt,
    double? rating,
    int? participants,
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
      isLike: isLike ?? this.isLike,
    );
  }
}
