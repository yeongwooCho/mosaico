class EventModel {
  final String title;
  final String imagePath;
  final List<String> tags;
  final DateTime startAt;
  final DateTime endAt;
  final double rating;
  final int participants;

  EventModel({
    required this.title,
    required this.imagePath,
    required this.tags,
    required this.startAt,
    required this.endAt,
    required this.rating,
    required this.participants,
  });
}
