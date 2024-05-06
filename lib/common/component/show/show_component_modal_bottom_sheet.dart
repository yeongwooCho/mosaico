import 'package:flutter/material.dart';
import 'package:mosaico/category/component/category_model_bottom_sheet.dart';
import 'package:mosaico/common/const/colors.dart';

void showCategoryModalBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    useSafeArea: true,
    isDismissible: true,
    isScrollControlled: true,
    context: context,
    barrierColor: MyColor.barrier,
    backgroundColor: MyColor.empty,
    builder: (_) {
      return const CategoryModalBottomSheet();
    },
  );
}
