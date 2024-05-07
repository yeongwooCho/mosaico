import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosaico/common/utils/data_utils.dart';
import 'package:mosaico/event/model/rating_model.dart';
import 'package:mosaico/user/model/user_model.dart';
import 'package:mosaico/user/provider/user_provider.dart';

final ratingsRandomProvider =
    Provider.family<List<RatingModel>, int>((ref, count) {
  final ratings = ref.watch(ratingsProvider);

  final ids = DataUtils.getRandomId(
    dividerNumber: ratings.length,
    count: count,
  );

  return ratings.where((element) => ids.contains(element.id)).toList();
});

final ratingsProvider =
    StateNotifierProvider<RatingStateNotifier, List<RatingModel>>(
  (ref) {
    final users = ref.watch(friendsProvider).toList();

    return RatingStateNotifier(users: users);
  },
);

class RatingStateNotifier extends StateNotifier<List<RatingModel>> {
  final List<UserModel> users;

  RatingStateNotifier({
    required this.users,
  }) : super([]) {
    initItems();
  }

  void initItems() {
    final ratings = users.mapIndexed(
      (index, element) => RatingModel(
        id: index.toString(),
        user: element,
        score: 4,
        content:
            '안녕하세요! 이번 이벤트게 참여하게 되었는데 엄청 좋은 경험이라 리뷰를 남기게 되었습니다. 처음으로 리뷰 남겨보네요. 이벤트에서 배운 점을 바로 적용해보니 너무 재밌는 취미를 갖게 된 것 같아요 감사합니다.',
      ),
    );

    state = [...ratings];
  }
}
