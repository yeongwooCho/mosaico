import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosaico/common/const/image_path.dart';
import 'package:mosaico/event/model/event_detail_model.dart';
import 'package:mosaico/event/model/event_model.dart';
import 'package:mosaico/event/model/rating_model.dart';
import 'package:mosaico/user/model/user_model.dart';

final eventsOfLikeProvider = Provider<List<EventModel>>((ref) {
  final events = ref.watch(eventsProvider);

  return events.where((element) => element.isLike).toList();
});

final eventsOfParticipationProvider = Provider<List<EventModel>>((ref) {
  final events = ref.watch(eventsProvider);

  return events.where((element) => element.isParticipation).toList();
});

final eventDetailProvider = Provider.family<EventModel, String>((ref, id) {
  final events = ref.watch(eventsProvider);

  return events.where((element) => element.id == id).first;
});

final eventsProvider =
    StateNotifierProvider<EventStateNotifier, List<EventModel>>(
  (ref) => EventStateNotifier(),
);

class EventStateNotifier extends StateNotifier<List<EventModel>> {
  EventStateNotifier() : super([]) {
    state = getItems();
  }

  void updateLike({
    required String id,
  }) {
    state = state.map((e) {
      if (e.id == id) {
        return e.copyWith(isLike: !e.isLike);
      }
      return e;
    }).toList();
  }

  List<EventModel> getItems() {
    return [
      EventDetailModel(
        id: '0',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 3, 22),
        endAt: DateTime(2024, 4, 21),
        rating: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
        detail: '디테일 샬라샬라',
        condition: '조건 샬라살랴',
        graphData: [1,54,62,82,93,155,255,344,555,675,744,833,922],
        ratings: [
          RatingModel(
            id: '1',
            user: UserModel(
              id: '1',
              username: 'asdf1234',
              password: '1234',
              name: '이수연',
              phone: '01012341234',
              profileImage: ImagePath.logo,
              keywords: [
                'as',
                'zx',
                'xc',
              ],
              seeList: [],
            ),
            score: 4,
            content: '안녕하세요! 이번 이벤트게 참여하게 되었는데 엄청 좋은 경험이라 리뷰를 남기게 되었습니다. 처음으로 리뷰 남겨보네요. 이벤트에서 배운 점을 바로 적용해보니 너무 재밌는 취미를 갖게 된 것 같아요 감사합니다.',
          ),
          RatingModel(
            id: '1',
            user: UserModel(
              id: '1',
              username: 'asdf1234',
              password: '1234',
              name: '이수연',
              phone: '01012341234',
              profileImage: ImagePath.logo,
              keywords: [
                'as',
                'zx',
                'xc',
              ],
              seeList: [],
            ),
            score: 4,
            content: '안녕하세요! 이번 이벤트게 참여하게 되었는데 엄청 좋은 경험이라 리뷰를 남기게 되었습니다. 처음으로 리뷰 남겨보네요. 이벤트에서 배운 점을 바로 적용해보니 너무 재밌는 취미를 갖게 된 것 같아요 감사합니다.',
          ),
          RatingModel(
            id: '1',
            user: UserModel(
              id: '1',
              username: 'asdf1234',
              password: '1234',
              name: '이수연',
              phone: '01012341234',
              profileImage: ImagePath.logo,
              keywords: [
                'as',
                'zx',
                'xc',
              ],
              seeList: [],
            ),
            score: 4,
            content: '안녕하세요! 이번 이벤트게 참여하게 되었는데 엄청 좋은 경험이라 리뷰를 남기게 되었습니다. 처음으로 리뷰 남겨보네요. 이벤트에서 배운 점을 바로 적용해보니 너무 재밌는 취미를 갖게 된 것 같아요 감사합니다.',
          ),
        ],
        category: '',
      ),

      EventModel(
        id: '1',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 3, 2),
        endAt: DateTime(2024, 4, 2),
        rating: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: false,
        category: '',
      ),
      EventModel(
        id: '2',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 4, 22),
        endAt: DateTime(2024, 5, 21),
        rating: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
        category: '',
      ),
      EventModel(
        id: '3',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 4, 22),
        endAt: DateTime(2024, 5, 21),
        rating: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: false,
        category: '',
      ),
      EventModel(
        id: '4',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 4, 2),
        endAt: DateTime(2024, 5, 30),
        rating: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
        category: '',
      ),
      EventModel(
        id: '5',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 4, 2),
        endAt: DateTime(2024, 5, 30),
        rating: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: false,
        category: '',
      ),
      EventModel(
        id: '6',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 5, 6),
        endAt: DateTime(2024, 5, 21),
        rating: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
        category: '',
      ),
      EventModel(
        id: '7',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 5, 6),
        endAt: DateTime(2024, 5, 21),
        rating: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: false,
        category: '',
      ),
      EventModel(
        id: '8',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 4, 22),
        endAt: DateTime(2024, 5, 21),
        rating: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
        category: '',
      ),
      EventModel(
        id: '9',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 4, 22),
        endAt: DateTime(2024, 5, 21),
        rating: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: false,
        category: '',
      ),
    ];
  }
}
