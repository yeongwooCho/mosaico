import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mosaico/ai/view/ai_screen.dart';
import 'package:mosaico/common/component/show/show_category_modal_bottom_sheet.dart';
import 'package:mosaico/common/const/colors.dart';
import 'package:mosaico/common/const/text_styles.dart';
import 'package:mosaico/common/layout/default_layout.dart';
import 'package:mosaico/common/view/error_screen.dart';
import 'package:mosaico/event/view/event_screen.dart';
import 'package:mosaico/friend/view/friend_screen.dart';
import 'package:mosaico/profile/view/profile_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RootTab extends StatelessWidget {
  final Widget child;

  const RootTab({
    super.key,
    required this.child,
  });

  int getIndex(BuildContext context) {
    switch (GoRouterState.of(context).location) {
      case '/friend':
        return 0;
      case '/event':
        return 1;
      case '/category':
        return 2;
      case '/profile':
        return 3;
      case '/ai':
        return 4;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: MyColor.white,
        selectedItemColor: MyColor.text,
        selectedLabelStyle: MyTextStyle.bodyBold.copyWith(fontSize: 12.0),
        unselectedItemColor: MyColor.middleGrey,
        unselectedFontSize: 12.0,
        unselectedLabelStyle: MyTextStyle.bodyBold.copyWith(fontSize: 12.0),
        type: BottomNavigationBarType.fixed,
        currentIndex: getIndex(context),
        onTap: (int index) {
          switch (index) {
            case 0:
              context.goNamed(FriendScreen.routeName);
            case 1:
              context.goNamed(EventScreen.routeName);
            case 2:
              showCategoryModalBottomSheet(context: context);
            case 3:
              context.goNamed(ProfileScreen.routeName);
            case 4:
              context.goNamed(AiScreen.routeName);
            default:
              context.goNamed(ErrorScreen.routeName);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.users(),
              size: 30.0,
            ),
            label: '친구',
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.house(),
              size: 30.0,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.list(),
              size: 30.0,
            ),
            label: '카테고리',
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.user(),
              size: 30.0,
            ),
            label: '내 정보',
          ),
          BottomNavigationBarItem(
            activeIcon: Text(
              'AI',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            icon: Text(
              'AI',
              style: TextStyle(
                fontSize: 20.0,
                color: MyColor.middleGrey,
              ),
            ),
            label: '제작',
          ),
        ],
      ),
      child: child,
    );
  }
}
