import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/component/default_button.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_layout.dart';

class CompletionScreen extends StatelessWidget {
  static String get routeName => 'completion';

  const CompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final title = GoRouterState.of(context).pathParameters['title'];
    return DefaultLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Text(
                title!,
                style: MyTextStyle.headTitle,
              ),
            ),
            PrimaryButton(
              onPressed: () {
                // context.goNamed(ProductScreen.routeName);
              },
              child: const Text('홈으로 이동'),
            )
          ],
        ),
      ),
    );
  }
}
