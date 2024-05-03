import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosaico/common/component/custom_ink_well_button.dart';
import 'package:mosaico/common/component/custom_text_form_field.dart';
import 'package:mosaico/common/component/default_button.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/common/utils/data_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class InputInfoScreen extends ConsumerStatefulWidget {
  static String get routeName => 'input_info';

  const InputInfoScreen({super.key});

  @override
  ConsumerState<InputInfoScreen> createState() => _InputInfoScreenState();
}

class _InputInfoScreenState extends ConsumerState<InputInfoScreen> {
  bool isLoading = false;
  String? email;
  String? password;
  String? passwordCheck;
  String birth = '생년월일';
  bool? gender;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: '회원가입'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40.0, right: 24.0, left: 24.0),
        child: PrimaryButton(
          onPressed: () async {
            setState(() {
              isLoading = true;
            });
            await Future.delayed(const Duration(seconds: 1));
            setState(() {
              isLoading = false;
            });

            // context.goNamed(ProductScreen.routeName);
          },
          child: const Text('확인'),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20.0),
              const Text(
                '계정 정보를\n입력해 주세요.',
                style: MyTextStyle.headTitle,
              ),
              const SizedBox(height: 40.0),
              CustomTextFormField(
                hintText: '아이디',
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField(
                hintText: '비밀번호(영문, 숫자, 특수문자 합 8~15자)',
                obscureText: true,
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField(
                hintText: '비밀번호 확인',
                obscureText: true,
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                textInputType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
