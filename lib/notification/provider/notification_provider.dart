import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosaico/notification/model/notification_model.dart';

final notificationDetailProvider =
    Provider.family<NotificationModel?, String>((ref, id) {
  final events = ref.watch(notificationProvider);

  return events.where((element) => element.id == id).firstOrNull;
});

final notificationProvider =
    StateNotifierProvider<NotificationStateNotifier, List<NotificationModel>>(
  (ref) => NotificationStateNotifier(),
);

class NotificationStateNotifier extends StateNotifier<List<NotificationModel>> {
  NotificationStateNotifier()
      : super([
          NotificationModel(
            id: '0',
            title: '2024년 5월 일정 안내',
            description:
                '동해물과 백두산이 마르고 닳도록 하느님이 보우하나 우리 나라 만세입니다. 하느님이 보우하사 우리 나라 만세 무궁화 삼천리 동해물과 백두산이 마르고 닳도록 하느님이 보우하나 우리 나라 만세입니다. 하느님이 보우하사 우리 나라 만세 무궁화 삼천리',
            createAt: DateTime(2024, 5, 3, 16, 49),
          ),
          NotificationModel(
            id: '1',
            title: '[약관/정책 변경] 수수료 변경에 따른 서비스 이용약관 수정',
            description:
                '동해물과 백두산이 마르고 닳도록 하느님이 보우하나 우리 나라 만세입니다. 하느님이 보우하사 우리 나라 만세 무궁화 삼천리 동해물과 백두산이 마르고 닳도록 하느님이 보우하나 우리 나라 만세입니다. 하느님이 보우하사 우리 나라 만세 무궁화 삼천리',
            createAt: DateTime(2024, 5, 1, 10, 9),
          ),
          NotificationModel(
            id: '2',
            title: '4월 벚꽃 축제 이벤트',
            description:
                '동해물과 백두산이 마르고 닳도록 하느님이 보우하나 우리 나라 만세입니다. 하느님이 보우하사 우리 나라 만세 무궁화 삼천리 동해물과 백두산이 마르고 닳도록 하느님이 보우하나 우리 나라 만세입니다. 하느님이 보우하사 우리 나라 만세 무궁화 삼천리',
            createAt: DateTime(2024, 4, 24, 16, 4),
          ),
          NotificationModel(
            id: '3',
            title: '[앱 기능성 개선] 카테고리 선택 다양화 추가',
            description:
                '동해물과 백두산이 마르고 닳도록 하느님이 보우하나 우리 나라 만세입니다. 하느님이 보우하사 우리 나라 만세 무궁화 삼천리 동해물과 백두산이 마르고 닳도록 하느님이 보우하나 우리 나라 만세입니다. 하느님이 보우하사 우리 나라 만세 무궁화 삼천리',
            createAt: DateTime(2024, 4, 1, 1, 4),
          ),
          NotificationModel(
            id: '4',
            title: '2024년 이벤트 구독 기능 업데이트',
            description:
                '동해물과 백두산이 마르고 닳도록 하느님이 보우하나 우리 나라 만세입니다. 하느님이 보우하사 우리 나라 만세 무궁화 삼천리 동해물과 백두산이 마르고 닳도록 하느님이 보우하나 우리 나라 만세입니다. 하느님이 보우하사 우리 나라 만세 무궁화 삼천리',
            createAt: DateTime(2024, 3, 24, 17, 7),
          ),
          NotificationModel(
            id: '5',
            title: '2024년 이벤트 구독 기능 업데이트',
            description:
                '동해물과 백두산이 마르고 닳도록 하느님이 보우하나 우리 나라 만세입니다. 하느님이 보우하사 우리 나라 만세 무궁화 삼천리 동해물과 백두산이 마르고 닳도록 하느님이 보우하나 우리 나라 만세입니다. 하느님이 보우하사 우리 나라 만세 무궁화 삼천리',
            createAt: DateTime(2024, 3, 4, 13, 39),
          ),
          NotificationModel(
            id: '6',
            title: '2024년 이벤트 구독 기능 업데이트',
            description:
                '동해물과 백두산이 마르고 닳도록 하느님이 보우하나 우리 나라 만세입니다. 하느님이 보우하사 우리 나라 만세 무궁화 삼천리 동해물과 백두산이 마르고 닳도록 하느님이 보우하나 우리 나라 만세입니다. 하느님이 보우하사 우리 나라 만세 무궁화 삼천리',
            createAt: DateTime(2024, 2, 15, 12, 33),
          ),
        ]);
}
