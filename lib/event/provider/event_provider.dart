import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosaico/common/const/image_path.dart';
import 'package:mosaico/common/utils/data_utils.dart';
import 'package:mosaico/event/model/event_detail_model.dart';
import 'package:mosaico/event/model/event_model.dart';
import 'package:mosaico/event/model/rating_model.dart';
import 'package:mosaico/event/provider/rating_provider.dart';

final eventsRandomProvider =
    Provider.family<List<EventModel>, int>((ref, count) {
  final events = ref.watch(eventsProvider);

  final ids = DataUtils.getRandomId(
    dividerNumber: events.length,
    count: count,
  );

  return events.where((element) => ids.contains(element.id)).toList();
});

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
  (ref) => EventStateNotifier(ref: ref),
);

/// 상태관리
/// TODO: 행위가 필요하면(Read) ref를 받아서 사용해야 한다.
/// 그런데 데이터가 필요한 경우, watch를 사용할 경우라면 provider에서 watch하고
/// 데이터를 전달해주는게 맞다.
///

class EventStateNotifier extends StateNotifier<List<EventModel>> {
  final Ref ref;

  EventStateNotifier({
    required this.ref,
  }) : super([]) {
    initItems();
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

  void participate({
    required String id,
  }) {
    state = state.map((e) {
      if (e.id == id) {
        return e.copyWith(isParticipation: true);
      }
      return e;
    }).toList();
  }

  void addRating({
    required String eventId,
    required RatingModel rating,
  }) {
    state = state.map((e) {
      if (e.id == eventId) {
        return e.copyWith(ratings: [...e.ratings, rating]);
      }
      return e;
    }).toList();
  }

  void initItems() {
    state = [
      EventDetailModel(
        id: '0',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 3, 22),
        endAt: DateTime(2024, 4, 21),
        totalRatingPoint: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
        detail: '디테일 샬라샬라',
        condition: '조건 샬라살랴',
        graphData: [1,54,62,82,93,155,255,344,555,675,744,833,922],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
      ),
      EventDetailModel(
        id: '1',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 3, 22),
        endAt: DateTime(2024, 4, 21),
        totalRatingPoint: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
        detail: '디테일 샬라샬라',
        condition: '조건 샬라살랴',
        graphData: [1, 54, 62, 82, 93, 155, 255, 344, 555, 675, 744, 833, 922],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
      ),
      EventDetailModel(
        id: '2',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 3, 22),
        endAt: DateTime(2024, 4, 21),
        totalRatingPoint: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
        detail: '디테일 샬라샬라',
        condition: '조건 샬라살랴',
        graphData: [1, 54, 62, 82, 93, 155, 255, 344, 555, 675, 744, 833, 922],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
      ),
      EventDetailModel(
        id: '3',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 3, 22),
        endAt: DateTime(2024, 4, 21),
        totalRatingPoint: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
        detail: '디테일 샬라샬라',
        condition: '조건 샬라살랴',
        graphData: [1, 54, 62, 82, 93, 155, 255, 344, 555, 675, 744, 833, 922],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
      ),
      EventDetailModel(
        id: '4',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 3, 22),
        endAt: DateTime(2024, 4, 21),
        totalRatingPoint: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
        detail: '디테일 샬라샬라',
        condition: '조건 샬라살랴',
        graphData: [1, 54, 62, 82, 93, 155, 255, 344, 555, 675, 744, 833, 922],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
      ),
      EventDetailModel(
        id: '5',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 3, 22),
        endAt: DateTime(2024, 4, 21),
        totalRatingPoint: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
        detail: '디테일 샬라샬라',
        condition: '조건 샬라살랴',
        graphData: [1, 54, 62, 82, 93, 155, 255, 344, 555, 675, 744, 833, 922],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
      ),
      EventDetailModel(
        id: '6',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 3, 22),
        endAt: DateTime(2024, 4, 21),
        totalRatingPoint: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
        detail: '디테일 샬라샬라',
        condition: '조건 샬라살랴',
        graphData: [1, 54, 62, 82, 93, 155, 255, 344, 555, 675, 744, 833, 922],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
      ),
      EventDetailModel(
        id: '7',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 3, 22),
        endAt: DateTime(2024, 4, 21),
        totalRatingPoint: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
        detail: '디테일 샬라샬라',
        condition: '조건 샬라살랴',
        graphData: [1, 54, 62, 82, 93, 155, 255, 344, 555, 675, 744, 833, 922],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
      ),
      EventDetailModel(
        id: '8',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 3, 22),
        endAt: DateTime(2024, 4, 21),
        totalRatingPoint: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
        detail: '디테일 샬라샬라',
        condition: '조건 샬라살랴',
        graphData: [1, 54, 62, 82, 93, 155, 255, 344, 555, 675, 744, 833, 922],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
      ),
      EventDetailModel(
        id: '9',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 3, 22),
        endAt: DateTime(2024, 4, 21),
        totalRatingPoint: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
        detail: '디테일 샬라샬라',
        condition: '조건 샬라살랴',
        graphData: [1, 54, 62, 82, 93, 155, 255, 344, 555, 675, 744, 833, 922],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
      ),
      EventDetailModel(
        id: '10',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 3, 22),
        endAt: DateTime(2024, 4, 21),
        totalRatingPoint: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
        detail: '디테일 샬라샬라',
        condition: '조건 샬라살랴',
        graphData: [1, 54, 62, 82, 93, 155, 255, 344, 555, 675, 744, 833, 922],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
      ),
      EventDetailModel(
        id: '11',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 3, 22),
        endAt: DateTime(2024, 4, 21),
        totalRatingPoint: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
        detail: '디테일 샬라샬라',
        condition: '조건 샬라살랴',
        graphData: [1, 54, 62, 82, 93, 155, 255, 344, 555, 675, 744, 833, 922],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
      ),
    ];
  }
}
