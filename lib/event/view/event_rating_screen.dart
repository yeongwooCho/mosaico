import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosaico/common/component/custom_text_form_field.dart';
import 'package:mosaico/common/component/default_button.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/event/component/event_card.dart';
import 'package:mosaico/event/provider/event_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EventRatingScreen extends ConsumerStatefulWidget {
  static String get routeName => "rating";

  final String id;

  const EventRatingScreen({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<EventRatingScreen> createState() => _EventRatingScreenState();
}

class _EventRatingScreenState extends ConsumerState<EventRatingScreen> {
  int ratingPoint = 0;

  @override
  Widget build(BuildContext context) {
    final event = ref.watch(eventDetailProvider(widget.id));

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '참여후기 작성'),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  '참여한 이벤트',
                  style: MyTextStyle.bodyTitleMedium,
                ),
              ),
              const SizedBox(height: 8.0),
              EventCard.fromModel(
                model: event,
                isButton: false,
              ),
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  '참여 후기',
                  style: MyTextStyle.bodyTitleMedium,
                ),
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField(
                onChanged: (String? value) {},
                onSaved: (String? value) {},
                validator: (String? value) {
                  return null;
                },
                hintText: "최대 300자 이내로 작성해 주세요.",
                maxLines: 6,
              ),
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '별점',
                      style: MyTextStyle.bodyTitleMedium,
                    ),
                    Text(
                      '${ratingPoint + 1} / 5',
                      style: MyTextStyle.bodyTitleMedium,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  5,
                  (index) => IconButton(
                    onPressed: () {
                      setState(() {
                        ratingPoint = index;
                      });
                    },
                    icon: PhosphorIcon(
                      index <= ratingPoint
                          ? PhosphorIcons.star(PhosphorIconsStyle.fill)
                          : PhosphorIcons.star(),
                      size: 50.0,
                      color: MyColor.secondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              PrimaryButton(
                onPressed: () {},
                child: Text('작성 완료'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
