import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/component/custom_text_form_field.dart';
import 'package:mosaico/common/component/default_button.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/image_path.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/event/view/event_screen.dart';
import 'package:mosaico/user/view/term_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EmailLoginScreen extends StatefulWidget {
  static String get routeName => "email_login";

  const EmailLoginScreen({super.key});

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  bool isAutoLogin = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: '이메일 로그인'),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100.0),
              Image.asset(
                ImagePath.logo,
                width: MediaQuery.of(context).size.width * 3 / 7,
              ),
              const SizedBox(height: 60.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                    hintText: "아이디",
                    onChanged: (String value) {},
                    onSaved: (String? newValue) {},
                    validator: (String? value) {},
                  ),
                  const SizedBox(height: 4.0),
                  CustomTextFormField(
                    hintText: "비밀번호",
                    onChanged: (String value) {},
                    onSaved: (String? newValue) {},
                    validator: (String? value) {},
                  ),
                  const SizedBox(height: 20.0),
                  PrimaryButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      setState(() {
                        isLoading = false;
                      });
                      context.goNamed(EventScreen.routeName);
                    },
                    child: const Text('로그인'),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              renderAutoLogin(),
              const SizedBox(height: 40.0),
              const _BottomButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderAutoLogin() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isAutoLogin = !isAutoLogin;
        });
      },
      child: Container(
        color: MyColor.white,
        height: 40.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isAutoLogin
                ? PhosphorIcon(
                    PhosphorIcons.checkCircle(
                      PhosphorIconsStyle.fill,
                    ),
                    color: MyColor.primary,
                    size: 24.0,
                  )
                : PhosphorIcon(
                    PhosphorIcons.checkCircle(
                      PhosphorIconsStyle.regular,
                    ),
                    color: MyColor.middleGrey,
                    size: 24.0,
                  ),
            const SizedBox(width: 6.0),
            const Text(
              '자동 로그인',
              style: MyTextStyle.bodyRegular,
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomButtons extends StatelessWidget {
  const _BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        renderButton(
          title: '  회원가입  ',
          onPressed: () {
            context.goNamed(TermScreen.routeName);
          },
        ),
        renderDivider(),
        renderButton(
          title: ' 아이디 찾기',
          onPressed: () {},
        ),
        renderDivider(),
        renderButton(
          title: '비밀번호 찾기',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget renderDivider() {
    return Container(
      color: MyColor.middleGrey,
      height: 16.0,
      width: 1.0,
    );
  }

  Widget renderButton({
    required String title,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: MyTextStyle.descriptionRegular.copyWith(
          color: MyColor.darkGrey,
        ),
      ),
    );
  }
}
