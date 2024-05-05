import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosaico/category/model/category_model.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

final categoryProvider =
    StateNotifierProvider<CategoryStateNotifier, List<CategoryModel>>((ref) {
  return CategoryStateNotifier();
});

class CategoryStateNotifier extends StateNotifier<List<CategoryModel>> {
  CategoryStateNotifier()
      : super(
          [
            CategoryModel(
              icon: PhosphorIcon(
                PhosphorIcons.wrench(),
                size: 28.0,
              ),
              key: '테크 · 가전',
              values: [
                '테크·가전 전체',
                '생활가전',
                '주방가전',
                '스마트가전',
                'DIY',
                '엔터테인먼트가전',
                '웨어러블',
                '주변기기',
                '로봇',
                'App·Web',
              ],
            ),
            CategoryModel(
              icon: PhosphorIcon(
                PhosphorIcons.tShirt(),
                size: 28.0,
              ),
              key: '패션',
              values: [
                '패션 전체',
                '의류',
                '패션소품',
                '주얼리',
                '가방',
                '신발',
                '아이웨어',
                '언더웨어',
                '키즈',
                '럭셔리',
              ],
            ),
            CategoryModel(
              icon: PhosphorIcon(
                PhosphorIcons.flower(),
                size: 28.0,
              ),
              key: '뷰티',
              values: [
                '뷰티 전체',
                '스킨케어',
                '바디케어',
                '헤어케어',
                '선케어',
                '메이크업',
                '클렌징',
                '네일',
                '향수',
                '비건',
                '구강용품',
                '위생용품',
                '성 웰니스',
                '뷰티서비스',
                '뷰티디바이스',
              ],
            ),
            CategoryModel(
              icon: PhosphorIcon(
                PhosphorIcons.chalkboardTeacher(),
                size: 28.0,
              ),
              key: '클래스',
              values: [
                '클래스 전체',
                '부업·수익',
                '경제·경영',
                '자기계발',
                '입시',
                '취미',
                '커리어',
              ],
            ),
            CategoryModel(
              icon: PhosphorIcon(
                PhosphorIcons.houseLine(),
                size: 28.0,
              ),
              key: '홈 · 리빙',
              values: [
                '홈·리빙 전체',
                '침실',
                '욕실',
                '주방',
                '청소·세탁',
                '인테리어',
                'DIY',
                '인센스·방향제',
                '화훼·원예',
                '홈케어서비스',
              ],
            ),
            CategoryModel(
              icon: PhosphorIcon(
                PhosphorIcons.sneakerMove(),
                size: 28.0,
              ),
              key: '스포츠 · 아웃도어',
              values: [
                '스포츠·아웃도어 전체',
                '캠핑',
                '골프',
                '자전거',
                '러닝',
                '테니스',
                '헬스',
                '홈트레이닝',
                '등산',
                '낚시',
                '스포츠 레슨',
              ],
            ),
            CategoryModel(
              icon: PhosphorIcon(
                PhosphorIcons.bowlFood(),
                size: 28.0,
              ),
              key: '푸드',
              values: [
                '푸드 전체',
                '산지직송',
                '로컬맛집',
                '해외수입',
                '비건',
                '레스토랑',
                '간편식',
                '헬스·이너뷰티',
                '소스·조미료',
                '디저트·간식',
                '음료·커피',
                '전통주',
                '와인',
              ],
            ),
            CategoryModel(
              icon: PhosphorIcon(
                PhosphorIcons.dog(),
                size: 28.0,
              ),
              key: '반려동물',
              values: [
                '반려동물 전체',
                '강아지',
                '고양이',
                '파충류',
                '물고기',
              ],
            ),
          ],
        );
}
