import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/src/core/presentation/tab_screen_mixin.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';
import 'package:inventory/src/core/presentation/extensions/tab_screen_extensions.dart';
import 'package:inventory/src/core/presentation/home_cubit.dart';
import 'package:inventory/src/features/declutter/presentation/hub/hub_screen.dart';
import 'package:inventory/src/features/overview/presentation/overview_screen.dart';
import 'package:inventory/src/features/tasks/presentation/tasks_screen.dart';
import 'package:inventory/service_locator.dart';

const List<TabScreen> _tabScreens = [
  OverviewScreen(),
  DeclutterHubScreen(),
  TasksScreen(),
];

class HomeShell extends StatelessWidget {
  static const String routeName = "/";

  const HomeShell({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeCubit>(),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, int>(
          builder: (context, index) {
            return IndexedStack(
              index: index,
              children: _tabScreens,
            );
          },
        ),
        bottomNavigationBar:
            context.isIos ? const _CupertinoNavigationBar() : const _MaterialNavigationBar(),
      ),
    );
  }
}

class _MaterialNavigationBar extends StatelessWidget {
  const _MaterialNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      builder: (context, index) {
        return NavigationBar(
          selectedIndex: index,
          destinations: _tabScreens.map((tabScreen) {
            return tabScreen.getMaterialDestination(context);
          }).toList(),
          onDestinationSelected: (value) {
            context.read<HomeCubit>().selectTab(value);
          },
        );
      },
    );
  }
}

class _CupertinoNavigationBar extends StatelessWidget {
  const _CupertinoNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      builder: (context, index) {
        return CupertinoTabBar(
          items: _tabScreens.map((tabScreen) {
            return tabScreen.getCupertinoDestination(context);
          }).toList(),
          currentIndex: index,
          onTap: (value) {
            context.read<HomeCubit>().selectTab(value);
          },
        );
      },
    );
  }
}
