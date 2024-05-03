import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/user/view/const/terms.dart';

class TermDetailScreen extends StatelessWidget {
  static String get routeName => 'term_detail';

  const TermDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = GoRouterState.of(context).pathParameters['id'];

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: getTitle(
          id: id,
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Text(
            getDescription(
              id: id,
            ),
            style: MyTextStyle.descriptionRegular.copyWith(
              color: MyColor.darkGrey,
            ),
          ),
        ),
      ),
    );
  }

  String getTitle({
    required String? id,
  }) {
    switch (id) {
      case '0':
        return '이용약관 동의';
      case "1":
        return '개인정보 취급방침 동의';
      case "2":
        return '마케팅 정보 수신 동의';
      default:
        return '약관 동의';
    }
  }

  String getDescription({
    required String? id,
  }) {
    switch (id) {
      case '0':
        return TermData.useTerm;
      case "1":
        return TermData.personalInfo;
      case "2":
        return TermData.marketing;
      default:
        return '';
    }
  }
}
