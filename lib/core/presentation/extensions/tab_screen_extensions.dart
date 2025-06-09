import 'package:flutter/material.dart';
import 'package:inventory/core/domain/entities/tab_screen.dart';

extension TabScreenExtensions on TabScreen {
  NavigationDestination get materialDestination {
    return NavigationDestination(
      selectedIcon: tabSelectedIcon,
      icon: tabIcon,
      label: tabLabel,
    );
  }

  BottomNavigationBarItem get cupertinoDestination {
    return BottomNavigationBarItem(
      icon: tabCupertinoIcon,
      activeIcon: tabCupertinoSelectedIcon,
      label: tabLabel,
    );
  }
}
