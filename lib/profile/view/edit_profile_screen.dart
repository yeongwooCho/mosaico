import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/category/provider/category_provider.dart';
import 'package:mosaico/common/component/custom_text_form_field.dart';
import 'package:mosaico/common/component/show/show_custom_toast.dart';
import 'package:mosaico/common/component/default_button.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/user/provider/user_provider.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  static String get routeName => "edit_profile";

  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final MultiSelectController _controller = MultiSelectController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  List<String> selectedDropdownItems = [];

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final categories = ref.watch(categoryProvider);
    final keywords = categories.map((e) => e.key).toList();

    _nameController.text = user.name;
    _phoneController.text = user.phone;

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '내 정보 수정'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: PrimaryButton(
          onPressed: () {
            ref.read(userProvider.notifier).updateInfo(
                  name: _nameController.text,
                  phone: _phoneController.text,
                );

            ref.read(userProvider.notifier).updateKeywords(
              newKeywords: [...selectedDropdownItems],
            );

            showCustomToast(context, msg: '저장이 완료되었습니다.');
            context.pop();
          },
          child: const Text('저장하기'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 20.0,
        ),
        child: Container(
          color: MyColor.empty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Text(
                  '개인정보',
                  style: MyTextStyle.bodyTitleMedium,
                ),
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField(
                controller: _nameController,
                onChanged: (String? value) {},
                onSaved: (String? value) {},
                validator: (String? value) {
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField(
                controller: _phoneController,
                onChanged: (String? value) {},
                onSaved: (String? value) {},
                validator: (String? value) {
                  return null;
                },
              ),
              const SizedBox(height: 40.0),
              const Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Text(
                  '관심 키워드',
                  style: MyTextStyle.bodyTitleMedium,
                ),
              ),
              const SizedBox(height: 8.0),
              MultiSelectDropDown(
                controller: _controller,
                onOptionSelected: (options) {
                  selectedDropdownItems = options.map((e) => e.label).toList();
                },
                onOptionRemoved: (index, option) {},
                options: keywords
                    .mapIndexed((index, element) => ValueItem<int>(
                          label: element,
                          value: index,
                        ))
                    .toList(),
                maxItems: 3,
                selectionType: SelectionType.multi,
                chipConfig: ChipConfig(
                  wrapType: WrapType.wrap,
                  backgroundColor: MyColor.white,
                  labelColor: MyColor.text,
                  deleteIcon: PhosphorIcon(
                    PhosphorIcons.xCircle(),
                    color: MyColor.text,
                  ),
                  spacing: 4.0,
                  runSpacing: 0.0,
                  radius: 8.0,
                ),

                // 일반 상태
                optionTextStyle: MyTextStyle.descriptionRegular,
                optionsBackgroundColor: MyColor.empty,

                // 선택된 상태
                selectedOptionBackgroundColor: MyColor.lightGrey,
                selectedOptionTextColor: Colors.red,
                showChipInSingleSelectMode: true,
                selectedOptionIcon: PhosphorIcon(
                  PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
                ),

                // 선택된 데이터
                selectedOptions: keywords
                    .mapIndexed((index, element) {
                      if (user.keywords.contains(element)) {
                        return ValueItem<int>(
                          label: element,
                          value: index,
                        );
                      } else {
                        return const ValueItem<int>(
                          label: '',
                          value: -1,
                        );
                      }
                    })
                    .where((element) => element.value != -1)
                    .toList(),

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
            ],
          ),
        ),
      ),
    );
  }
}
