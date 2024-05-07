import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/common/component/custom_text_form_field.dart';
import 'package:mosaico/common/component/default_button.dart';
import 'package:mosaico/common/component/show/show_custom_toast.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/common/utils/data_utils.dart';
import 'package:mosaico/event/component/event_card.dart';
import 'package:mosaico/event/model/rating_model.dart';
import 'package:mosaico/event/provider/event_provider.dart';
import 'package:mosaico/event/view/event_screen.dart';
import 'package:mosaico/user/provider/user_provider.dart';
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
  String content = '';

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userMeProvider);
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
                onChanged: (String? value) {
                  if (value == null) {
                    content = '';
                  } else {
                    content = value;
                  }
                },
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
                onPressed: () {
                  final id = DataUtils.getUuid();
                  final rating = RatingModel(
                    id: id,
                    user: user,
                    score: ratingPoint,
                    content: content,
                  );

                  ref.read(eventsProvider.notifier).addRating(
                        eventId: event.id,
                        rating: rating,
                      );

                  showCustomToast(context, msg: '등록이 완료되었습니다.');
                  context.goNamed(EventScreen.routeName);
                },
                child: const Text('작성 완료'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
