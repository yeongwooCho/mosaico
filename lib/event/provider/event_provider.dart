import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosaico/common/const/image_path.dart';
import 'package:mosaico/event/model/event_model.dart';

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
      EventModel(
        id: '0',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 4, 22),
        endAt: DateTime(2024, 5, 21),
        rating: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
      ),
      EventModel(
        id: '1',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 4, 22),
        endAt: DateTime(2024, 5, 21),
        rating: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: false,
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
        isParticipation: true,
      ),
      EventModel(
        id: '4',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 4, 22),
        endAt: DateTime(2024, 5, 21),
        rating: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
      ),
      EventModel(
        id: '5',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 4, 22),
        endAt: DateTime(2024, 5, 21),
        rating: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
      ),
      EventModel(
        id: '6',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 4, 22),
        endAt: DateTime(2024, 5, 21),
        rating: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
      ),
      EventModel(
        id: '7',
        title: '[바디워시] 나를 위한 시간 13분! 바디관리 하나로 끝! <워시+각질제거+입욕+향>',
        imagePath: ImagePath.image,
        tags: ['신상품', '세일', '온라인 단독', '사은품'],
        startAt: DateTime(2024, 4, 22),
        endAt: DateTime(2024, 5, 21),
        rating: 4.9,
        participants: 12456,
        isLike: true,
        isParticipation: true,
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
      ),
    ];
  }
}
