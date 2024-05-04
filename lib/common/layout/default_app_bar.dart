import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  static const defaultAppBarHeight = 60.0;
  final String title;
  final Widget? titleWidget;
  final List<Widget>? action;
  final Widget? leading;
  final double? elevation;
  final bool centerTitle;

  const DefaultAppBar({
    super.key,
    required this.title,
    this.titleWidget,
    this.leading,
    this.action,
    this.elevation,
    this.centerTitle = true,
  });

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();

  @override
  Size get preferredSize =>
      const Size(double.infinity, DefaultAppBar.defaultAppBarHeight);
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: (widget.titleWidget == null)
          ? Text(
              widget.title,
              style: MyTextStyle.bodyBold,
            )
          : widget.titleWidget,
      leading: widget.leading,
      leadingWidth: 72.0,
      centerTitle: widget.centerTitle,
      actions: widget.action,
      elevation: widget.elevation ?? 0.0,
      backgroundColor: MyColor.white,
      foregroundColor: MyColor.text,
    );
  }
}
