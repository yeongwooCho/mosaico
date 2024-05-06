import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/component/custom_text_form_field.dart';
import 'package:mosaico/common/component/default_button.dart';
import 'package:mosaico/common/component/show/show_custom_toast.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomerCenterModalBottomSheet extends ConsumerWidget {
  static String get routeName => "customer_center";

  const CustomerCenterModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 340.0,
      decoration: const BoxDecoration(
        color: MyColor.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '문의 등록하기',
                  style: MyTextStyle.bigTitleBold,
                ),
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: PhosphorIcon(PhosphorIcons.x()),
                  iconSize: 32.0,
                )
              ],
            ),
            const SizedBox(height: 8.0),
            CustomTextFormField(
              onChanged: (String? value) {},
              onSaved: (String? value) {},
              validator: (String? value) {
                return null;
              },
              hintText: "문의 할 내용을 작성해 주세요.",
              maxLines: 6,
            ),
            const SizedBox(height: 20.0),
            PrimaryButton(
              onPressed: () {
                showCustomToast(context, msg: "등록이 완료되었습니다.");
                context.pop();
              },
              child: const Text('확인'),
            ),
          ],
        ),
      ),
    );
  }
}
