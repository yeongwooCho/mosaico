import 'package:flutter/material.dart';
import 'package:mosaico/category/component/category_model_bottom_sheet.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/profile/component/customer_center_modal_bottom_sheet.dart';

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

void showCustomerCenterModalBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    useSafeArea: true,
    isDismissible: true,
    isScrollControlled: true,
    context: context,
    barrierColor: MyColor.barrier,
    backgroundColor: MyColor.empty,
    builder: (_) {
      return CustomerCenterModalBottomSheet();
    },
  );
}
