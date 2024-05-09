import 'package:mosaico/event/model/event_model.dart';

class UserModel {
  final String id; // primary key
  final String username; // 아이디
  final String password; // 비밀번호
  final String name; // 이름
  final String phone; // 휴대폰
  final String profileImage; // 이미지 경로
  final List<String> seeList; // List EventModel id

  final List<String> keywords; // 관심 키워드

  UserModel({
    required this.id,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
    required this.profileImage,
    required this.keywords,
    required this.seeList,
  });

  UserModel copyWith({
    String? id,
    String? username,
    String? password,
    String? name,
    String? phone,
    String? profileImage,
    List<String>? keywords,
    List<String>? seeList,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      profileImage: profileImage ?? this.profileImage,
      keywords: keywords ?? this.keywords,
      seeList: seeList ?? this.seeList,
    );
  }
}
