import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/component/custom_text_form_field.dart';
import 'package:mosaico/common/component/custom_toast.dart';
import 'package:mosaico/common/const/button_style.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/user/view/input_info_screen.dart';

class CertificationScreen extends StatefulWidget {
  static String get routeName => 'certification';

  const CertificationScreen({super.key});

  @override
  State<CertificationScreen> createState() => _CertificationScreenState();
}

class _CertificationScreenState extends State<CertificationScreen> {
  bool isPushCertification = false;
  bool isDoneCertification = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: '회원가입'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              '본인 인증을\n진행해 주세요.',
              style: MyTextStyle.headTitle,
            ),
            const SizedBox(height: 40.0),
            CustomTextFormField(
              hintText: '이름',
              onChanged: (String value) {},
              onSaved: (String? newValue) {},
              validator: (String? value) {
                return null;
              },
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: '휴대폰 번호',
                    onChanged: (String value) {},
                    onSaved: (String? newValue) {},
                    validator: (String? value) {
                      return null;
                    },
                    textInputType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    showCustomToast(context, msg: '인증번호가 전송되었습니다.');
                    setState(() {
                      isPushCertification = true;
                    });
                  },
                  style: MyButtonStyle.secondary,
                  child: isPushCertification
                      ? const Text('재 전송')
                      : const Text('인증번호 전송'),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Visibility(
              visible: isPushCertification && !isDoneCertification,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      hintText: '인증번호 입력',
                      onChanged: (String value) {},
                      onSaved: (String? newValue) {},
                      validator: (String? value) {
                        return null;
                      },
                      textInputType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      setState(() {
                        isLoading = false;
                      });
                      context.goNamed(InputInfoScreen.routeName);
                    },
                    style: MyButtonStyle.secondary,
                    child: const Text('인증번호 확인'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
