import 'package:flutter/material.dart';
import 'package:inventory/src/core/presentation/tab_screen_mixin.dart';

extension TabScreenExtensions on TabScreen {
  NavigationDestination getMaterialDestination(BuildContext context) {
    return NavigationDestination(
      selectedIcon: tabSelectedIcon,
      icon: tabIcon,
      label: tabLabel(context),
    );
  }

  BottomNavigationBarItem getCupertinoDestination(BuildContext context) {
    return BottomNavigationBarItem(
      icon: tabCupertinoIcon,
      activeIcon: tabCupertinoSelectedIcon,
      label: tabLabel(context),
    );
  }
}
