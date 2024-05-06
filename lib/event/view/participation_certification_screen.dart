import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/component/custom_text_form_field.dart';
import 'package:mosaico/common/component/show/show_custom_toast.dart';
import 'package:mosaico/common/const/button_style.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/event/view/participation_term_screen.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ParticipationCertificationScreen extends StatefulWidget {
  static String get routeName => 'participation_certification';

  final String id;

  const ParticipationCertificationScreen({
    super.key,
    required this.id,
  });

  @override
  State<ParticipationCertificationScreen> createState() =>
      _CertificationScreenState();
}

class _CertificationScreenState
    extends State<ParticipationCertificationScreen> {
  bool isPushCertification = false;
  bool isDoneCertification = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: '본인 인증'),
      child: SingleChildScrollView(
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
              MultiSelectDropDown<int>(
                onOptionSelected: (List<ValueItem> selectedOptions) {
                  // selectedDropdownItems = options.map((e) => e.label).toList();
                },
                options: ['선택', 'SK', 'KT', 'LG', '알뜰폰SK', '알뜰폰KT', '알뜰폰LG']
                    .mapIndexed(
                      (index, element) => ValueItem<int>(
                        label: element,
                        value: index,
                      ),
                    )
                    .toList(),
                selectionType: SelectionType.single,
                chipConfig: const ChipConfig(wrapType: WrapType.wrap),

                // 일반 상태
                optionTextStyle: MyTextStyle.descriptionRegular,
                optionsBackgroundColor: MyColor.empty,

                // 선택된 상태
                singleSelectItemStyle: MyTextStyle.descriptionRegular,
                selectedOptionBackgroundColor: MyColor.lightGrey,
                selectedOptionTextColor: Colors.red,
                selectedOptionIcon: PhosphorIcon(
                  PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
                ),

                // 선택된 데이터
                selectedOptions: [
                  ValueItem(label: '선택', value: 0),
                ],
                disabledOptions: [
                  ValueItem(label: '선택', value: 0),
                ],

                // top
                borderRadius: 8.0,
                borderColor: MyColor.middleGrey,
                borderWidth: 1.0,
                clearIcon: null,

                // bottom
                dropdownHeight: 320,
                dropdownBorderRadius: 8.0,
                focusedBorderColor: MyColor.primary,
                focusedBorderWidth: 2.0,
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
                        FocusScope.of(context).unfocus();

                        setState(() {
                          isLoading = true;
                        });
                        await Future.delayed(const Duration(seconds: 1));
                        setState(() {
                          isLoading = false;
                        });
                        context.pushNamed(
                          ParticipationTermScreen.routeName,
                          pathParameters: {'id': widget.id},
                        );
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
      ),
    );
  }
}
