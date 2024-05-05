import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/category/model/category_model.dart';
import 'package:mosaico/category/view/category_screen.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CategoryCard extends StatefulWidget {
  final CategoryModel category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    // width
    final double fullWidth = MediaQuery.of(context).size.width;

    // Container height
    final values = widget.category.values;
    final int phase = values.length % 2 == 0 ? values.length ~/ 2 : values
        .length ~/ 2 + 1;
    final double containerHeight = (phase * 48) + ((phase - 1) * 8) + (16 * 2);

    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          child: Container(
            color: MyColor.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        widget.category.icon,
                        const SizedBox(width: 12.0),
                        Text(
                          widget.category.key,
                          style: MyTextStyle.bodyTitleMedium,
                        ),
                      ],
                    ),
                    PhosphorIcon(
                      isVisible
                          ? PhosphorIcons.caretUp()
                          : PhosphorIcons.caretDown(),
                      size: 28.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedContainer(
          height: isVisible ? containerHeight : 0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: List.generate(
                isVisible ? values.length : 0,
                    (index) =>
                    InkWell(
                      onTap: () {
                        context.pushNamed(
                          CategoryScreen.routeName,
                          pathParameters: {'title': values[index]},
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: MyColor.text,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        width: (fullWidth - 48 - 8) / 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Center(
                            child: Text(
                              values[index],
                              style: MyTextStyle.descriptionRegular,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
