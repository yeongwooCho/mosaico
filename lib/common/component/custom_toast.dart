import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';

void showCustomToast(
  context, {
  required String msg,
  Duration? toastDuration,
  Color backgroundColor = MyColor.text,
  Color foregroundColor = MyColor.white,
}) {
  final fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: backgroundColor.withOpacity(0.8),
    ),
    child: Text(
      msg,
      style: MyTextStyle.bodyBold.copyWith(
        color: foregroundColor,
      ),
      textAlign: TextAlign.center,
    ),
  );

  fToast.showToast(
    child: toast,
    toastDuration: toastDuration ?? const Duration(seconds: 1),
    positionedToastBuilder: (context, child) {
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          child,
        ],
      );
    },
  );
}
