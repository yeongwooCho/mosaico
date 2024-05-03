import 'package:flutter/material.dart';
import 'package:mosaico/common/component/custom_loading.dart';
import 'package:mosaico/common/const/colors.dart';

class DefaultLayout extends StatefulWidget {
  final Color? backgroundColor;
  final PreferredSizeWidget? appbar;
  final Widget? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;
  final Widget child;
  final bool isLoading;

  const DefaultLayout({
    super.key,
    this.backgroundColor,
    this.appbar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    required this.child,
    this.isLoading = false,
  });

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: widget.appbar,
          backgroundColor: widget.backgroundColor ?? MyColor.white,
          // 기본배경이 완전 흰색은 아니다.
          body: SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: widget.child,
            ),
          ),
          bottomNavigationBar: widget.bottomNavigationBar,
          floatingActionButton: widget.floatingActionButton,
        ),
        Positioned.fill(
          child: Visibility(
            visible: widget.isLoading,
            child: Container(
              color: MyColor.barrier,
              child: const Center(
                child: CustomLoadingScreen(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
