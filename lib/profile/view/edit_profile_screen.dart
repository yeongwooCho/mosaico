import 'package:flutter/material.dart';
import 'package:mosaico/common/layout/default_app_bar.dart';
import 'package:mosaico/common/layout/default_layout.dart';

class EditProfileScreen extends StatelessWidget {
  static String get routeName => "edit_profile";

  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(title: '내 정보 수정'),
      child: const Placeholder(),
    );
  }
}
