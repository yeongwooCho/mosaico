import 'package:mosaico/user/model/user_model.dart';

class RatingModel {
  final String id;
  final UserModel user;
  final int rating;
  final String content;

  RatingModel({
    required this.id,
    required this.user,
    required this.rating,
    required this.content,
  });
}
