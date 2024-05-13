import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosaico/event/model/event_detail_model.dart';
import 'package:mosaico/event/model/event_model.dart';
import 'package:mosaico/event/model/rating_model.dart';
import 'package:mosaico/event/provider/rating_provider.dart';
import 'package:mosaico/user/provider/user_provider.dart';

// final eventsBySelectedFriendProvider = Provider<List<EventModel>>((ref) {
//   final selectedFriend = ref.watch(selectedFriendProvider);
//   final randomNumber = DataUtils.getRandomNumber(dividerNumber: 4);
//
//   final events = ref.watch(eventsRandomProvider(randomNumber));
//   ref.notifyListeners();
//
//   return events;
// });

// final eventsRandomProvider =
//     Provider.family<List<EventModel>, int>((ref, count) {
//   final events = ref.watch(eventsProvider);
//
//   final ids = DataUtils.getRandomId(
//     dividerNumber: events.length,
//     count: count,
//   );
//
//   return events.where((element) => ids.contains(element.id)).toList();
// });

final eventsOfSeeListProvider = Provider<List<EventModel>>((ref) {
  final events = ref.watch(eventsProvider);
  final user = ref.watch(userMeProvider);

  final newList = user.seeList
      .map<EventModel>((id) => events.firstWhere((e) => e.id == id))
      .toList();

  return newList.reversed.toList();
});

final eventsOfLikeProvider = Provider<List<EventModel>>((ref) {
  final events = ref.watch(eventsProvider);

  return events.where((element) => element.isLike).toList();
});

final eventsOfParticipationProvider = Provider<List<EventModel>>((ref) {
  final events = ref.watch(eventsProvider);

  final now = DateTime.now();
  final nowDate = DateTime(now.year, now.month, now.day);

  return events.where((element) => element.isParticipation && (!nowDate.isBefore(element.startAt))).toList();
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
        title: '[아이디어] 백화점 퀄리티 겨울 패딩',
        imagePath: 'asset/img/events/1.webp',
        tags: [
          '#고급겨울패딩',
          '#백화점퀄리티',
          '#따뜻한소재',
          '#트렌디디자인',
          '#겨울필수아이템',
        ],
        startAt: DateTime(2024, 5, 12),
        endAt: DateTime(2024, 5, 17),
        totalRatingPoint: 4.9,
        isLike: true,
        isParticipation: false,
        detail:
            '''백화점 퀄리티 겨울 패팅 어때요?\n\n· 아이디어가 마음에 드시면 좋아요! 의견이 있으시다면 댓글로 남겨주세요^^\n· 참여해주시면 아이디어가 제품이 되었을때 특별 혜택을 받으실 수 있어요.\n· 해당 아이디어는 법적으로 보호받고 있습니다. 모두 함께 크리에이터의 창작물을 보호해요~''',
        condition: "없음",
        graphData: [
          1,
          24,
          62,
          82,
          93,
          155,
          255,
          344,
        ],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
        isRatingDone: false,
        detailImages: [],
      ),
      EventDetailModel(
        id: '1',
        title: "[이벤트] 루미자동차 소형 루카 런칭 이벤트",
        imagePath: 'asset/img/events/2.webp',
        tags: [
          '#루카친환경전기차',
          '#도심주행최적화',
          '#혁신적인디자인',
          '#스마트모빌리티솔루션',
        ],
        startAt: DateTime(2024, 5, 12),
        endAt: DateTime(2024, 5, 17),
        totalRatingPoint: 4.8,
        isLike: false,
        isParticipation: false,
        detail:
            '''루미자동차 소형 루카 런칭 이벤트 NEW\n\n혜택\n1등  네이버페이 30만원 (1명)\n2등 스타벅스 커피쿠폰 5만원(3명)\n3등 스타벅스 아아 쿠폰 (5명)''',
        condition: "30대 이상 남여, 신용 2등급이상",
        graphData: [
          1,
          54,
          62,
          82,
          93,
          155,
          255,
          344,
          555,
        ],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
        isRatingDone: false,
        detailImages: [],
      ),
      EventDetailModel(
        id: '2',
        title: '[아이디어] 48시간 유지력 립케어 립스틱이 나온다면?',
        imagePath: 'asset/img/events/3.webp',
        tags: [
          '#48시간지속',
          '#고보습립케어',
          '#장시간유지립스틱',
          '#매끄러운발림성',
          '#색상지속력우수',
        ],
        startAt: DateTime(2024, 5, 12),
        endAt: DateTime(2024, 5, 17),
        totalRatingPoint: 4.9,
        isLike: true,
        isParticipation: true,
        detail:
            '48시간 유지력 립케어 립스틱이 나온다면?\n\n· 아이디어가 마음에 드시면 좋아요! 의견이 있으시다면 댓글로 남겨주세요^^\n· 참여해주시면 아이디어가 제품이 되었을때 특별 혜택을 받으실 수 있어요.\n· 해당 아이디어는 법적으로 보호받고 있습니다. 모두 함께 크리에이터의 창작물을 보호해요~',
        condition: "없음",
        graphData: [
          1,
          54,
          62,
          555,
          675,
        ],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
        isRatingDone: false,
        detailImages: [],
      ),
      EventDetailModel(
        id: '3',
        title: '[이벤트] 뷰티하라 기미크림런칭 기념',
        imagePath: 'asset/img/events/4.webp',
        tags: [
          '#피부톤균일화',
          '#미백기능성',
          '#자연유래성분',
          '#민감성피부',
        ],
        startAt: DateTime(2024, 5, 12),
        endAt: DateTime(2024, 5, 17),
        totalRatingPoint: 4.6,
        isLike: false,
        isParticipation: true,
        detail:
            '''“맑고 균일한 피부, 뷰티하라 기미크림으로 시작하세요.”\n기미, 잡티 없이 깨끗한 피부를 위한 첫걸음\n미백 기능성 인증: 이 특징은 제품이 공식적으로 미백 효과가 있다는 것을 인증받았음을 의미합니다. 보통 이러한 인증은 관련 규제 기관에서 엄격한 테스트와 평가를 거쳐 주어지며, 제품이 피부의 색소 침착을 줄이거나 피부 톤을 밝게 하는 데 효과적임을 보증합니다.\n자연 유래 성분 함유: 제품에 포함된 성분들이 자연에서 유래되었다는 것을 나타냅니다. 이는 화학적으로 합성된 성분보다 자연에서 추출한 성분들을 많이 사용했음을 의미하며, 종종 이러한 성분들이 더 건강하고 환경에도 덜 해롭다고 여겨집니다. 자연 유래 성분은 피부에 더 순하고 알레르기 반응을 줄일 수 있는 잠재력이 있습니다.\n민감성 피부도 안심 사용: 이 특징은 제품이 민감성 피부를 가진 사람들도 사용할 수 있도록 설계되었다는 것을 의미합니다. 민감성 피부를 위한 제품은 일반적으로 피부 자극을 최소화하기 위해 특별히 선별된 성분을 사용하고, 자극적인 첨가물이나 강한 화학 성분을 피하여 제조됩니다. 이로 인해 피부가 예민한 사람들도 부담 없이 사용할 수 있습니다.''',
        condition:
            '''뷰티하라 기미크림 런칭 기념 이벤트 NEW\n참여조건: 30대 이상 여성\n참여미션: 뷰티하라 카카오톡 채널 구독\n참여기간: 2024/05/12 ~ 2024/05/17\n\n혜택\n1등 신세계 10만원 상품권(1명)\n2등 스타벅스 커피쿠폰 5만원(3명)\n3등 스타벅스 아아 쿠폰 (5명)''',
        graphData: [
          1,
          54,
          62,
          82,
          93,
          155,
          255,
          344,
          555,
          675,
        ],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
        isRatingDone: false,
        detailImages: [],
      ),
      EventDetailModel(
        id: '4',
        title: '[설문조사] 운스샴푸 시제품체험',
        imagePath: 'asset/img/events/5.webp',
        tags: [
          '#모발영양강화',
          '#천연성분함유',
          '#두피건강케어',
          '#부드러운거품',
          '#민감성두피',
        ],
        startAt: DateTime(2024, 5, 12),
        endAt: DateTime(2024, 5, 17),
        totalRatingPoint: 4.0,
        isLike: true,
        isParticipation: true,
        detail:
            '이 제품은 시제품입니다. 시제품이지만 검증된 기관에서 수차례 확인후 체험단을 모집합니다. 안심하시고 사용해보시고 상세한 설문조사에 응해주시면 됩니다.',
        condition:
            '''운스샴푸 시제품 체험단 모집\n참여조건: 30대 이상 여성\n모집인원: 10 명\n참여기간: 2024/05/12 ~ 2024/05/17\n혜택: 5만원 지급''',
        graphData: [
          1,
          54,
          62,
          82,
          93,
          155,
          1237,
        ],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
        isRatingDone: false,
        detailImages: [],
      ),
      EventDetailModel(
        id: '5',
        title: '[예약구매] 아르플래 바디각질크림',
        // imagePath: 'asset/img/event/5.png',
        imagePath: 'asset/img/events/6.webp',
        tags: [
          '#부드러운각질제거',
          '#보습효과강화',
          '#피부진정효과',
          '#자연유래성분',
        ],

        startAt: DateTime(2024, 5, 12),
        endAt: DateTime(2024, 5, 17),
        totalRatingPoint: 4.7,
        isLike: true,
        isParticipation: false,
        detail: '',
        condition:
            '''특별한 혜택으로 돌아온 아르플래 바디각질크림\n참여기간: 2024/05/12 ~ 2024/05/17\n목표참여자: 500명''',
        graphData: [
          1,
          54,
          62,
          82,
          93,
          155,
          255,
          1611,
          1711,
          1811
        ],
        ratings: ref.read(ratingsRandomProvider(7)),
        category: '',
        isRatingDone: false,
        detailImages: [
          'asset/img/events/details/1.png',
          'asset/img/events/details/2.png',
          'asset/img/events/details/3.png',
          'asset/img/events/details/4.png',
          'asset/img/events/details/5.png',
        ],
      ),
      // EventDetailModel(
      //   id: '0',
      //   title: '[24시간 계획을 한눈에 보자!] 프레스선을 따라 펜을 그어 쓰는 플래너',
      //   imagePath: 'asset/img/event/0.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 5, 10),
      //   endAt: DateTime(2024, 9, 30),
      //   totalRatingPoint: 4.9,
      //   isLike: true,
      //   isParticipation: false,
      //   detail:
      //       '프레스 선을 따라 펜으로 긋는 재미, 한 눈에 파악 가능한 시간의 흐름, 입체적인 시계 표현까지! 지루한 일상을 플래닝의 즐거움으로 가득 채워 줄 재미있고 실용적인 플래너 입니다.',
      //   condition: "플래너를 사용하여 보다 체계적인 일정 관리를 통해 개인의 생산성 향상을 원하는 사용자.",
      //   graphData: [
      //     1,
      //     24,
      //     62,
      //     82,
      //     93,
      //     155,
      //     255,
      //     344,
      //     555,
      //     675,
      //     744,
      //     833,
      //     922,
      //     1234,
      //     2345,
      //     5465,
      //     7777,
      //     8888,
      //     10120
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: false,
      // ),
      // EventDetailModel(
      //   id: '1',
      //   title: "[주방정리소품] 뿌리고 닦으면 주방관리 끝! 프리미엄 주방도구 정리 진열대 스윙치",
      //   imagePath: 'asset/img/event/1.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 8, 11),
      //   endAt: DateTime(2024, 12, 31),
      //   totalRatingPoint: 4.8,
      //   isLike: false,
      //   isParticipation: false,
      //   detail: '스윙치를 사용하시면서 살림에 대한 질을 올려보세요. 정리의 차별화는 생각보다 가까운 곳에 있습니다.',
      //   condition: "주방을 깔끔하게 유지하고 싶고, 공간을 최적화하여 조리 과정을 더 효율적으로 만들고자 하는 사용자",
      //   graphData: [
      //     1,
      //     54,
      //     62,
      //     82,
      //     93,
      //     155,
      //     255,
      //     344,
      //     555,
      //     675,
      //     744,
      //     833,
      //     922,
      //     2178,
      //     4839,
      //     5689
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: false,
      // ),
      // EventDetailModel(
      //   id: '2',
      //   title: '차가 피어나는 꽃잔, 이중기 도자기 찻잔',
      //   imagePath: 'asset/img/event/2.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 5, 31),
      //   endAt: DateTime(2024, 7, 2),
      //   totalRatingPoint: 4.9,
      //   isLike: true,
      //   isParticipation: true,
      //   detail:
      //       '일상에 지친 현대인들에게 힐링이 되는 차 도구 세트로 담기는 차의 형태가 꽃 모양으로 보이도록 만들었어요. 소중한 사람과의 시간 속에 조금 특별한 추억이 되길 바랍니다.',
      //   condition: "현대 생활의 스트레스에서 벗어나 차를 통한 여유와 힐링을 추구하며 차 문화에 깊이 관심이 있는 사용자.",
      //   graphData: [
      //     1,
      //     54,
      //     62,
      //     82,
      //     93,
      //     155,
      //     255,
      //     344,
      //     555,
      //     675,
      //     744,
      //     833,
      //     922,
      //     1234,
      //     2345,
      //     3456,
      //     4567,
      //     5678,
      //     6789
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: false,
      // ),
      // EventDetailModel(
      //   id: '3',
      //   title: '세차하는 정비공 안경 거치대',
      //   imagePath: 'asset/img/event/3.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 6, 3),
      //   endAt: DateTime(2024, 7, 30),
      //   totalRatingPoint: 4.6,
      //   isLike: false,
      //   isParticipation: true,
      //   detail:
      //       '우리 집에 굴러다니는 돋보기안경, 그런데 정작 필요할 땐 "안경 어디다 뒀지?"  해본 경험 있으시죠? 안경도 자리가 필요합니다. 이제 더이상 찾아다니지말자구요! ',
      //   condition: "집안에서 자주 안경을 사용하고 빠르고 편리하게 안경을 보관하고자 하는 사용자.",
      //   graphData: [
      //     1,
      //     54,
      //     62,
      //     82,
      //     93,
      //     155,
      //     255,
      //     344,
      //     555,
      //     675,
      //     744,
      //     833,
      //     922,
      //     1111,
      //     3111,
      //     3133,
      //     4545,
      //     5656,
      //     9999,
      //     12345
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: false,
      // ),
      // EventDetailModel(
      //   id: '4',
      //   title: '가죽부터 이태리! 디자인부터 전통! 에르제 고트 스웨이드 사파리 자켓',
      //   imagePath: 'asset/img/event/4.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 8, 11),
      //   endAt: DateTime(2024, 12, 21),
      //   totalRatingPoint: 4.0,
      //   isLike: true,
      //   isParticipation: true,
      //   detail:
      //       '빈티지함과 캐주얼한 매력에 클래식한 스타일까지 소화해내는 다재다능한 고트(goat) 스웨이드 사파리 자켓을 소개합니다! 오래도록 소장할 수 있는 품질과 가격으로 만나보세요. ',
      //   condition: "장기간 사용 가능한 고급 가죽 제품에 투자를 원하며, 클래식하고 멋스러운 스타일을 추구하는 사용자.",
      //   graphData: [
      //     1,
      //     54,
      //     62,
      //     82,
      //     93,
      //     155,
      //     255,
      //     344,
      //     555,
      //     675,
      //     744,
      //     833,
      //     922,
      //     1111,
      //     1234,
      //     1235,
      //     1236,
      //     1237,
      //     3456
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: false,
      // ),
      // EventDetailModel(
      //   id: '5',
      //   title: '[닭가슴살] 한국 토종닭으로 만든 고단백 저칼로리 훈제 닭가슴살',
      //   imagePath: 'asset/img/event/5.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 7, 29),
      //   endAt: DateTime(2024, 9, 21),
      //   totalRatingPoint: 4.7,
      //   isLike: true,
      //   isParticipation: false,
      //   detail:
      //       '쫄깃한 탄력감! 토종닭의 육질! 다이어트에 효과가 있는 8가지 한방 성분 특허 기술의 질리지 않은 훈제 맛 닭가슴살을 경험해 보세요. 저희 업체에서는 100% 순수 국내산 토종 닭만 사용합니다!',
      //   condition: "건강을 우선시하고 고단백 저칼로리 식품으로 균형 잡힌 식습관을 유지하려는 사용자.",
      //   graphData: [
      //     1,
      //     54,
      //     62,
      //     82,
      //     93,
      //     155,
      //     255,
      //     344,
      //     555,
      //     675,
      //     744,
      //     833,
      //     922,
      //     1231,
      //     1311,
      //     1411,
      //     1511,
      //     1611,
      //     1711,
      //     1811
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: false,
      // ),
      // EventDetailModel(
      //   id: '6',
      //   title: '[패션시계] 빛으로 충전하는 솔라워치｜단 한번 충전으로 90일 파워리저브 APO',
      //   imagePath: 'asset/img/event/6.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 7, 22),
      //   endAt: DateTime(2024, 8, 21),
      //   totalRatingPoint: 4.1,
      //   isLike: false,
      //   isParticipation: true,
      //   detail:
      //       '빛으로 충전하는 솔라워치! 빛 아래 단 2분만에 하루의 충전량이 채워집니다. 감성부터 기능까지 아날로그 시계의 정점을 보여드릴게요!',
      //   condition: "친환경 제품을 선호하고 환경 보호에 기여하며 지속 가능한 라이프스타일을 지향하는 사용자.",
      //   graphData: [
      //     1,
      //     54,
      //     62,
      //     82,
      //     93,
      //     155,
      //     255,
      //     344,
      //     555,
      //     675,
      //     744,
      //     833,
      //     922,
      //     1111,
      //     1234,
      //     2345,
      //     3456,
      //     4567,
      //     5678
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: false,
      // ),
      // EventDetailModel(
      //   id: '7',
      //   title: '[개발기간4년] 편안하고 아늑한 <데스크테리어&독서공간 만들기>',
      //   imagePath: 'asset/img/event/7.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 5, 5),
      //   endAt: DateTime(2024, 6, 5),
      //   totalRatingPoint: 3.9,
      //   isLike: false,
      //   isParticipation: false,
      //   detail:
      //       '딱딱하고 평범했던 책상을 아늑한 무드로 바꿔주는 마법 아이템들을 소개합니다. PC 작업과 독서 습관을 더욱 즐겁게 해주는 "쿠오뜨"의 다양한 데스크테리어 소가구를 만나보세요.',
      //   condition: "개인 작업 공간을 개선하고 집안 분위기를 바꾸어보고 싶어하는 사용자.",
      //   graphData: [
      //     1,
      //     54,
      //     62,
      //     82,
      //     93,
      //     155,
      //     255,
      //     344,
      //     555,
      //     675,
      //     744,
      //     833,
      //     9221,
      //     10000
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: false,
      // ),
      // EventDetailModel(
      //   id: '8',
      //   title: '[패션시계] 평점 5점 시간을 보는 새로운 방식ㅣ하이스의 스마트 워치 MPA',
      //   imagePath: 'asset/img/event/8.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 4, 27),
      //   endAt: DateTime(2024, 6, 25),
      //   totalRatingPoint: 4.6,
      //   isLike: true,
      //   isParticipation: true,
      //   detail:
      //       '스마트 워치 종결자, 시간을 읽는 새로운 방식 하이스 스마트 워치 MPA, 시/분이 새겨진 2개의 레이어가 회전하며 가이드라인에 위치한 숫자가 현재 시각입니다.',
      //   condition: "최신 기술을 적극적으로 받아들이고 스마트 워치를 통해 생활의 편리함을 더하고자 하는 사용자.",
      //   graphData: [
      //     1,
      //     54,
      //     62,
      //     82,
      //     93,
      //     155,
      //     255,
      //     344,
      //     555,
      //     675,
      //     744,
      //     833,
      //     922,
      //     1234,
      //     2345,
      //     3456,
      //     4567
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: false,
      // ),
      // EventDetailModel(
      //   id: '9',
      //   title: '[기대이상!]무선충전 고성능 FM 라디오, 빈티지 블루투스 스피커 이거 하나로 끝!',
      //   imagePath: 'asset/img/event/9.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 5, 3),
      //   endAt: DateTime(2024, 9, 21),
      //   totalRatingPoint: 4.9,
      //   isLike: true,
      //   isParticipation: false,
      //   detail: '아이템 하나로 공간을 감성있는 곳으로! 소메주 빈티지 블루투스 스피커로 당신의 공간을 바꿔보세요!',
      //   condition: "빈티지 디자인을 즐기면서 최신 무선 충전 기술을 경험하고 싶은 사용자.",
      //   graphData: [1, 54, 62, 82, 93, 155, 255, 344, 555, 675, 744, 833, 922],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: false,
      // ),
      // EventDetailModel(
      //   id: '10',
      //   title: '셀프 커스텀, 유니크한 감성으로 탈바꿈ㅣ놀라운 가격혜택! 자동차 도색!',
      //   imagePath: 'asset/img/event/10.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 5, 8),
      //   endAt: DateTime(2024, 6, 30),
      //   totalRatingPoint: 4.3,
      //   isLike: false,
      //   isParticipation: true,
      //   detail:
      //       '전문가의 영역인 줄만 알았던 자동차 페인트! 유니크한 감성으로 이상한 페인트의 매력에 빠져보세요. 신발, 지갑, 가방, 벽지 모든 곳에도 페인트로 디자인 업그레이드! 인체 무해한 페인트로 당신의 공간을 무지개 공간으로 바꿔보세요!',
      //   condition: "자동차 커스텀 페인트에 관심이 있고 독특한 디자인을 자동차에 적용하고 싶은 사용자.",
      //   graphData: [
      //     1,
      //     54,
      //     62,
      //     82,
      //     93,
      //     155,
      //     255,
      //     344,
      //     555,
      //     675,
      //     744,
      //     833,
      //     922,
      //     5656,
      //     6666,
      //     9999
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: false,
      // ),
      // EventDetailModel(
      //   id: '11',
      //   title: '[선글라스] "몇번을 흔들어도 떨어지지 않아" 이중피팅 스포츠글라스, 써보면신세계!',
      //   imagePath: 'asset/img/event/11.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 4, 22),
      //   endAt: DateTime(2024, 6, 21),
      //   totalRatingPoint: 4.3,
      //   isLike: false,
      //   isParticipation: false,
      //   detail:
      //       '스포츠를 위한 선글라스. 시야와 착옹에 방해되는 코 받침을 없애 깃털처럼. 렌즈 교체는 단 10초면 끝. 착용만 하면 전문가 포스가 뿜뿜. 단 하나의 스포츠 선글라스.',
      //   condition: "액티브한 스포츠 활동에 참여하며 특히 안경의 안정성과 편안함을 중요시하는 사용자.",
      //   graphData: [
      //     1,
      //     54,
      //     62,
      //     82,
      //     93,
      //     155,
      //     255,
      //     344,
      //     555,
      //     675,
      //     744,
      //     833,
      //     922,
      //     1234,
      //     2323,
      //     2424,
      //     2525,
      //     4545,
      //     7676
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: false,
      // ),
      // EventDetailModel(
      //   id: '12',
      //   title: '[체스] 특별한 디자인의 쉽고 가벼운 미니멀 체스 미플체스',
      //   imagePath: 'asset/img/event/12.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 4, 2),
      //   endAt: DateTime(2024, 8, 21),
      //   totalRatingPoint: 4.4,
      //   isLike: true,
      //   isParticipation: false,
      //   detail:
      //       '이렇게 귀여운 체스 본 적 있어? 나무 미플로 재 탄생한 체스 기물들! 특별하게 디자인 된 미니멀 체스를 만나보세요!',
      //   condition: "체스 게임에 관심이 있으며, 특별하고 가벼운 미니멀리스트 디자인을 선호하는 사용자.",
      //   graphData: [
      //     1,
      //     54,
      //     62,
      //     82,
      //     93,
      //     155,
      //     255,
      //     344,
      //     555,
      //     675,
      //     744,
      //     833,
      //     922,
      //     1234,
      //     1234,
      //     1234,
      //     1234,
      //     1237
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: false,
      // ),
      // EventDetailModel(
      //   id: '13',
      //   title: '내 아이의 그림으로 세상에 하나뿐인 특별한 소품만들기',
      //   imagePath: 'asset/img/event/13.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 3, 22),
      //   endAt: DateTime(2024, 6, 21),
      //   totalRatingPoint: 4.5,
      //   isLike: false,
      //   isParticipation: false,
      //   detail:
      //       '내 아이의 그림으로 세상에서 하나뿐인 특별한 소품만들기 <아이별>\n세상에서 가장 특별한 내 아이의 그림으로\n생활소품을 만들어 함께 사용해보세요.\n아이의 자존감이 쑥쑥 커진답니다.',
      //   condition: "아이의 창의력을 증진시키고자 하며 아이의 그림으로 개인화된 소품을 만들고 싶은 사용자.",
      //   graphData: [
      //     1,
      //     54,
      //     62,
      //     82,
      //     93,
      //     155,
      //     255,
      //     344,
      //     555,
      //     675,
      //     744,
      //     833,
      //     922,
      //     1234,
      //     2345,
      //     3456,
      //     6789
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: false,
      // ),
      // EventDetailModel(
      //   id: '14',
      //   title: '[무료 각인] 휴대폰,컴퓨터 속 정보를 한번에! C타입 otg USB!',
      //   imagePath: 'asset/img/event/14.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 4, 21),
      //   endAt: DateTime(2024, 4, 25),
      //   totalRatingPoint: 4.6,
      //   isLike: false,
      //   isParticipation: true,
      //   detail:
      //       '터질듯이 꽉 차버린 휴대폰 속 정보, 어떻게 정리하세요? 한쪽에는 C타입, 한쪽에는 USB로 어느기기든 꼽기만 하면 쉽고 빠르게 저장완료! 와디즈에서는 무료각인까지!',
      //   condition: "다양한 기기 간 데이터 전송을 자주 하며 편리한 저장 솔루션을 찾는 사용자.",
      //   graphData: [
      //     1,
      //     54,
      //     62,
      //     82,
      //     93,
      //     155,
      //     255,
      //     344,
      //     555,
      //     675,
      //     744,
      //     833,
      //     922,
      //     12345,
      //     23546,
      //     34567
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: false,
      // ),
      // EventDetailModel(
      //   id: '15',
      //   title: '우리 일상을 자연스러움이 묻어나는 아름다운 사진, 이제 매년 기록해요',
      //   imagePath: 'asset/img/event/15.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 1, 2),
      //   endAt: DateTime(2024, 2, 2),
      //   totalRatingPoint: 4.9,
      //   isLike: true,
      //   isParticipation: false,
      //   detail:
      //       '행복하고 소중한 기억들, 이제 자주 기록해보세요. 사랑하는 배우자, 눈 깜짝할 새 크는 아이들, 부모님 얼굴에 핀 웃음꽃, 그리고 반려동물까지! 포카리/흑백필름/숲속풍경 컨셉!',
      //   condition: "가족 및 소중한 순간들을 정기적으로 기록하며 감성적인 사진을 찍고자 하는 사용자.",
      //   graphData: [
      //     1,
      //     54,
      //     62,
      //     82,
      //     93,
      //     155,
      //     255,
      //     344,
      //     555,
      //     675,
      //     744,
      //     833,
      //     922,
      //     2345,
      //     3456,
      //     4576
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: true,
      // ),
      // EventDetailModel(
      //   id: '16',
      //   title: '지면에 발구름없는 자체 추진 능력의 신개념 스케이트 보드',
      //   imagePath: 'asset/img/event/16.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 2, 22),
      //   endAt: DateTime(2024, 4, 22),
      //   totalRatingPoint: 4.3,
      //   isLike: false,
      //   isParticipation: false,
      //   detail:
      //       '라이딩을 즐기다 보면 미친듯이 소모되는 칼로리! 근력 + 유산소 운동도 이젠 속도감 있게 즐거보세요, 3d슬라이딩 보드, PITHONBOAR를 와디즈 한정 물량 으로 선 런칭합니다',
      //   condition: "신개념 스케이트보드를 통해 더욱 독특하고 즐거운 라이딩을 경험하고자 하는 사용자.",
      //   graphData: [
      //     1,
      //     54,
      //     62,
      //     82,
      //     93,
      //     155,
      //     2551,
      //     3144,
      //     5155,
      //     6175,
      //     7144,
      //     8133,
      //     9212,
      //     14576
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: false,
      // ),
      // EventDetailModel(
      //   id: '17',
      //   title: '"움직이는 벨트, 허리가 편안하다" 국산 벨트"',
      //   imagePath: 'asset/img/event/17.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 3, 2),
      //   endAt: DateTime(2024, 4, 1),
      //   totalRatingPoint: 3.9,
      //   isLike: true,
      //   isParticipation: true,
      //   detail:
      //       '남성들을 위한 벨트, 식사, 음주, 과식 후 벨트를 조절하기 불편하지 않으셨나요?\n벨트럽에서 개발한 벨트는 1~20mm 조절이 되므로 허리띠를 자신의 허리에 딱 맞출 수 있습니다 ',
      //   condition: "식사 후 벨트 조절의 불편함 없이 편안함을 추구하며, 고품질 국산 벨트를 원하는 사용자.",
      //   graphData: [
      //     11,
      //     154,
      //     162,
      //     812,
      //     913,
      //     1155,
      //     1255,
      //     1344,
      //     5155,
      //     6175,
      //     7144,
      //     8133
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: true,
      // ),
      // EventDetailModel(
      //   id: '18',
      //   title: '[10초컷] 쓱-꽂기만 하면, 감성 끝판왕 장식 완성!',
      //   imagePath: 'asset/img/event/18.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 3, 23),
      //   endAt: DateTime(2024, 4, 24),
      //   totalRatingPoint: 4.7,
      //   isLike: true,
      //   isParticipation: true,
      //   detail:
      //       '연말, 파티, 선물 포장 등 다양한 장식에 활용 가능한 코딩 끈. 작은 장식으로 새로운 분위기를 만들어 보세요!',
      //   condition: "간편하게 장식을 완성할 수 있는 솔루션을 찾으며 새로운 감성 장식에 관심 있는 사용자.",
      //   graphData: [
      //     12,
      //     542,
      //     622,
      //     822,
      //     932,
      //     1525,
      //     2525,
      //     3244,
      //     5255,
      //     6725,
      //     7244,
      //     8323,
      //     9222
      //   ],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: false,
      // ),
      // EventDetailModel(
      //   id: '19',
      //   title: '[노트] 한 권을 읽어도 제대로 기억되는, 아웃풋 독서노트',
      //   imagePath: 'asset/img/event/19.png',
      //   tags: ['신상품', '세일', '온라인 단독', '사은품'],
      //   startAt: DateTime(2024, 1, 22),
      //   endAt: DateTime(2024, 2, 21),
      //   totalRatingPoint: 4.9,
      //   isLike: false,
      //   isParticipation: false,
      //   detail:
      //       '하루 15분, 아웃풋 독서노트: 당신의 미래를 바꿀 수 있는 기회.\n\n책을 많이 읽는 다고 모두 부자가 될 수는 없습니다. 아웃풋 없는 독서는 시간 낭비 입니다. 이제 아웃푹 독서노트로 지식을 기록해 보세요!',
      //   condition: "독서 후 제대로된 아웃풋을 생성하고 싶은 사용자로서 지식을 체계적으로 기록하려는 사용자.",
      //   graphData: [1123, 5412, 6212, 8212, 9312, 15125],
      //   ratings: ref.read(ratingsRandomProvider(7)),
      //   category: '',
      //   isRatingDone: true,
      // ),
    ];
  }
}
