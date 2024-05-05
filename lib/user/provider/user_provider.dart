import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosaico/common/const/image_path.dart';
import 'package:mosaico/user/model/user_model.dart';

final userProvider = StateNotifierProvider<UserStateNotifier, UserModel>(
  (ref) => UserStateNotifier(),
);

class UserStateNotifier extends StateNotifier<UserModel> {
  UserStateNotifier()
      : super(UserModel(
            id: '1',
            username: 'event0877',
            password: 'event0877',
            name: '송정원',
            phone: '01012341234',
            profileImage: ImagePath.user,
            keywords: [
              '패션',
              '뷰티',
              '푸드',
            ]));

  void updateKeywords({required List<String> newKeywords}) {
    state = state.copyWith(
      keywords: newKeywords,
    );
  }

  void updateInfo({required String name, required String phone}) {
    state = state.copyWith(
      name: name,
      phone: phone,
    );
  }
}
