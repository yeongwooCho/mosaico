import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosaico/common/const/image_path.dart';
import 'package:mosaico/user/model/user_model.dart';

final friendsProvider = Provider<List<UserModel>>((ref) {
  final users = ref.watch(userProvider);
  return users.where((element) => element.id != '0').toList();
});

final userMeProvider = Provider<UserModel>((ref) {
  final userMe = ref.watch(userProvider)[0];
  return userMe;
});

final userProvider = StateNotifierProvider<UserStateNotifier, List<UserModel>>(
  (ref) => UserStateNotifier(),
);

class UserStateNotifier extends StateNotifier<List<UserModel>> {
  UserStateNotifier() : super([]) {
    initItems();
  }

  void updateKeywords({required List<String> newKeywords}) {
    state = [
      ...state.map((e) {
        if (e.id == '0') {
          return e.copyWith(
            keywords: newKeywords,
          );
        }
        return e;
      })
    ];
  }

  void updateInfo({required String name, required String phone}) {
    state = [
      ...state.map((e) {
        if (e.id == '0') {
          return e.copyWith(
            name: name,
            phone: phone,
          );
        }
        return e;
      })
    ];
  }

  void initItems() {
    state = [
      UserModel(
        id: '0',
        username: 'event0877',
        password: 'event0877',
        name: '송정원',
        phone: '01012341234',
        profileImage: ImagePath.user,
        keywords: [
          '패션',
          '뷰티',
          '푸드',
        ],
        seeList: [],
      ),
      UserModel(
        id: '1',
        username: 'event0877',
        password: 'event0877',
        name: '김하은',
        phone: '01012341234',
        profileImage: 'asset/img/user/1.png',
        keywords: [],
        seeList: [],
      ),
      UserModel(
        id: '2',
        username: 'event0877',
        password: 'event0877',
        name: '조수연',
        phone: '01012341234',
        profileImage: 'asset/img/user/2.png',
        keywords: [],
        seeList: [],
      ),
      UserModel(
        id: '3',
        username: 'event0877',
        password: 'event0877',
        name: '차태현',
        phone: '01012341234',
        profileImage: 'asset/img/user/3.png',
        keywords: [],
        seeList: [],
      ),
      UserModel(
        id: '4',
        username: 'event0877',
        password: 'event0877',
        name: '이수연',
        phone: '01012341234',
        profileImage: 'asset/img/user/4.png',
        keywords: [],
        seeList: [],
      ),
      UserModel(
        id: '5',
        username: 'event0877',
        password: 'event0877',
        name: '박현우',
        phone: '01012341234',
        profileImage: 'asset/img/user/5.png',
        keywords: [],
        seeList: [],
      ),
      UserModel(
        id: '6',
        username: 'event0877',
        password: 'event0877',
        name: '전예진',
        phone: '01012341234',
        profileImage: 'asset/img/user/6.png',
        keywords: [],
        seeList: [],
      ),
      UserModel(
        id: '7',
        username: 'event0877',
        password: 'event0877',
        name: '황종혁',
        phone: '01012341234',
        profileImage: 'asset/img/user/7.png',
        keywords: [],
        seeList: [],
      ),
      UserModel(
        id: '8',
        username: 'event0877',
        password: 'event0877',
        name: '이민서',
        phone: '01012341234',
        profileImage: 'asset/img/user/8.png',
        keywords: [],
        seeList: [],
      ),
    ];
  }
}
