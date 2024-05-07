import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/category/component/category_card.dart';
import 'package:mosaico/category/provider/category_provider.dart';
import 'package:mosaico/category/view/category_screen.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CategoryModalBottomSheet extends ConsumerWidget {
  const CategoryModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Container(
            height: 40.0,
            color: MyColor.empty,
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
                      onPressed: () {
                        context.pop();
                      },
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
          color: MyColor.white,
          child: InkWell(
            onTap: () {
              context.pushNamed(
                CategoryScreen.routeName,
                pathParameters: {'title': '전체보기'},
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Text(
                '전체보기',
                style: MyTextStyle.bodyTitleMedium,
              ),
            ),
          ),
        ),
        Container(color: MyColor.middleGrey, height: 1.0),
        Expanded(
          child: Container(
            color: MyColor.lightGrey,
            // height: MediaQuery.of(context).size.height - 200,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final category = categories[index];

                return CategoryCard(category: category);
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
        ),
      ],
    );
  }
}
