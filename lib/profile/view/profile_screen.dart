import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/component/show/show_component_modal_bottom_sheet.dart';
import 'package:mosaico/common/component/show/show_cupertino_alert.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/image_path.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/profile/view/edit_profile_screen.dart';
import 'package:mosaico/user/model/user_model.dart';
import 'package:mosaico/user/provider/user_provider.dart';
import 'package:mosaico/user/view/login_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileScreen extends ConsumerWidget {
  static String get routeName => "profile";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '내 정보',
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                context.pushNamed(EditProfileScreen.routeName);
              },
              icon: PhosphorIcon(
                PhosphorIcons.gear(),
                size: 32.0,
              ),
            ),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            renderProfileTitle(user: user),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                height: 10.0,
                color: MyColor.lightGrey,
              ),
            ),
            const Placeholder(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                height: 10.0,
                color: MyColor.lightGrey,
              ),
            ),
            renderIconAndTextButton(
              icon: PhosphorIcon(
                PhosphorIcons.question(),
                size: 28.0,
              ),
              title: '고객센터',
              onTap: () {
                showCustomerCenterModalBottomSheet(context: context);
              },
            ),
            renderIconAndTextButton(
              icon: PhosphorIcon(
                PhosphorIcons.signOut(),
                size: 28.0,
              ),
              title: '로그아웃',
              onTap: () {
                showCupertinoAlert(
                  context: context,
                  titleWidget: const Text('로그아웃 하시겠습니까?'),
                  completeText: '확인',
                  completeFunction: () {
                    context.goNamed(LoginScreen.routeName);
                  },
                  cancelText: '취소',
                  cancelFunction: () {
                    context.pop();
                  },
                );
              },
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }

  Widget renderProfileTitle({
    required UserModel user,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            ImagePath.user,
            height: 72.0,
            width: 72.0,
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${user.name}님 안녕하세요~",
                style: MyTextStyle.bigTitleRegular,
              ),
              const SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '관심 키워드',
                    style: MyTextStyle.bodyRegular,
                  ),
                  const SizedBox(height: 4.0),
                  Wrap(
                    spacing: 4.0,
                    children: [
                      ...user.keywords.map(
                        (e) => Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0, color: MyColor.primary),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 2.0,
                            ),
                            child: Text(
                              e,
                              style: MyTextStyle.minimumRegular.copyWith(
                                color: MyColor.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget renderIconAndTextButton({
    required Widget icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              icon,
              const SizedBox(width: 12.0),
              Text(
                title,
                style: MyTextStyle.bodyTitleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
