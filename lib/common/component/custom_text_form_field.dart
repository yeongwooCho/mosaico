import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;

  final TextEditingController? controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final int? maxLength;
  final int? maxLines;
  final bool realOnly;
  final bool enabled;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;

  const CustomTextFormField({
    super.key,
    required this.onChanged,
    required this.onSaved,
    required this.validator,
    this.controller,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.obscureText = false,
    this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.maxLength,
    this.maxLines = 1,
    this.realOnly = false,
    this.enabled = true,
    this.onEditingComplete,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      controller: controller,
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      obscureText: obscureText,
      obscuringCharacter: '●',
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            width: 2.0,
            color: MyColor.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0,
            color: MyColor.middleGrey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintText: hintText,
        hintStyle: (hintText == null)
            ? null
            : (hintStyle == null)
                ? MyTextStyle.bodyRegular.copyWith(
                    color: MyColor.darkGrey,
                  )
                : hintStyle,
        suffixIcon: suffixIcon,
      ),
      cursorColor: MyColor.primary,
      cursorHeight: 24.0,
      style: MyTextStyle.descriptionRegular,
      maxLength: maxLength,
      maxLines: maxLines,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      inputFormatters: textInputType == TextInputType.number
          ? [FilteringTextInputFormatter.digitsOnly]
          : [],
      readOnly: realOnly,
      enabled: enabled,
    );
  }
}
