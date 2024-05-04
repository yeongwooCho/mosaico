import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/category/component/category_card.dart';
import 'package:mosaico/category/const/data.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void showCategoryModalBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    isDismissible: true,
    isScrollControlled: true,
    context: context,
    barrierColor: MyColor.barrier,
    backgroundColor: MyColor.empty,
    builder: (_) {
      return Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                color: MyColor.empty,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: MyColor.lightGrey,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '카테고리',
                        style: MyTextStyle.bigTitleBold,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: PhosphorIcon(PhosphorIcons.x()),
                        iconSize: 32.0,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 500.0,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final category = categories[index];

                return CategoryCard(
                  title: category,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 1.0,
                  color: MyColor.middleGrey,
                );
              },
              itemCount: categories.length,
            ),
          ),
        ],
      );
    },
  );
}
