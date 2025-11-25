import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/service_locator.dart';
import 'package:inventory/src/core/presentation/app_router.dart';
import 'package:inventory/src/core/presentation/error_screen.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';
import 'package:inventory/src/core/presentation/loading_screen.dart';
import 'package:inventory/src/core/presentation/tab_screen_mixin.dart';
import 'package:inventory/src/core/presentation/utils/app_icons.dart';
import 'package:inventory/src/core/presentation/utils/dimensions.dart';
import 'package:inventory/src/features/declutter/domain/entities/declutter_session.dart';
import 'package:inventory/src/features/declutter/presentation/hub/hub_bloc.dart';
import 'package:inventory/src/features/declutter/presentation/hub/hub_event.dart';
import 'package:inventory/src/features/declutter/presentation/hub/hub_state.dart';

class DeclutterHubScreen extends StatelessWidget with TabScreen {
  const DeclutterHubScreen({super.key});

  @override
  String tabLabel(context) => context.s.screen_declutter;
  @override
  Icon get tabIcon => const Icon(Icons.cleaning_services_outlined);
  @override
  Icon get tabSelectedIcon => const Icon(Icons.cleaning_services);
  @override
  Icon get tabCupertinoIcon => const Icon(CupertinoIcons.rectangle_on_rectangle_angled);
  @override
  Icon get tabCupertinoSelectedIcon =>
      const Icon(CupertinoIcons.rectangle_fill_on_rectangle_angled_fill);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HubBloc>()..add(const HubActiveSessionsRequested()),
      child: BlocListener<HubBloc, HubState>(
        listenWhen: (previous, current) => current is HubNavigationSuccess,
        listener: (context, state) {
          if (state is HubNavigationSuccess) {
            DeclutterSwipeRoute(sessionId: state.sessionId).push(context);
          }
        },
        child: BlocBuilder<HubBloc, HubState>(
          builder: (context, state) {
            return switch (state) {
              HubInitial() || HubLoading() => const LoadingScreen(),
              HubLoadSuccess() => const _HubScreen(),
              HubError(:var message) => ErrorScreen(message: message),
              HubNavigationSuccess() => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}

class _HubScreen extends StatelessWidget {
  const _HubScreen();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HubBloc>().state;
    if (state is! HubLoadSuccess) {
      return const SizedBox.shrink();
    }
    final activeSessions = state.activeSessions;
    return Scaffold(
      appBar: context.isIos ? const _CupertinoAppBar() : const _MaterialAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.largeSpacing),
        children: [
          const SizedBox(height: Dimensions.smallSpacing),
          const _StartNewSessionTitle(),
          const SizedBox(height: Dimensions.mediumSpacing),
          const _NewSessionCard(),
          if (activeSessions.isNotEmpty) ...[
            const SizedBox(height: Dimensions.largeSpacing),
            const _ContinueSessionTitle(),
            for (final session in activeSessions) _ContinueSessionListTile(session: session),
          ],
        ],
      ),
    );
  }
}

class _MaterialAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MaterialAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(context.s.screen_declutter),
      centerTitle: true,
    );
  }
}

class _CupertinoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CupertinoAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(context.s.screen_declutter),
    );
  }
}

class _StartNewSessionTitle extends StatelessWidget {
  const _StartNewSessionTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      // TODO: Localize
      "Start a new session",
      style: context.t.headlineSmall,
    );
  }
}

class _NewSessionCard extends StatelessWidget {
  const _NewSessionCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _NewSessionCardListTile(
          isPrimary: true,
          icon: Icon(AppIcons.quick(context)),
          // TODO: Localize
          labelText: "Quick Check (10 items)",
          onTap: () {
            context.read<HubBloc>().add(const HubNewQuickSessionRequested());
          },
        ),
        const SizedBox(height: Dimensions.smallSpacing),
        _NewSessionCardListTile(
          icon: Icon(AppIcons.room(context)),
          // TODO: Localize
          labelText: "Declutter by location",
          onTap: () {
            // TODO: Show location picker dialog and use result id
            context.read<HubBloc>().add(const HubNewLocationSessionRequested(locationId: 0));
          },
        ),
        const SizedBox(height: Dimensions.smallSpacing),
        _NewSessionCardListTile(
          icon: Icon(AppIcons.tag(context)),
          // TODO: Localize
          labelText: "Declutter by date",
          onTap: () {
            // TODO: Show tag picker dialog and use result tag
            context.read<HubBloc>().add(const HubNewTagSessionRequested(tag: "example"));
          },
        ),
      ],
    );
  }
}

class _NewSessionCardListTile extends StatelessWidget {
  final bool isPrimary;
  final Icon? icon;
  final String labelText;
  final VoidCallback? onTap;
  const _NewSessionCardListTile({
    required this.labelText,
    this.isPrimary = false,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.mediumBorderRadius),
      ),
      tileColor: isPrimary ? context.c.secondaryContainer : context.c.surfaceContainer,
      leading: icon,
      title: Text(labelText),
      onTap: onTap,
    );
  }
}

class _ContinueSessionTitle extends StatelessWidget {
  const _ContinueSessionTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      // TODO: Localize
      "Continue a session",
      style: context.t.headlineSmall,
    );
  }
}

class _ContinueSessionListTile extends StatelessWidget {
  final DeclutterSession session;
  const _ContinueSessionListTile({required this.session});

  @override
  Widget build(BuildContext context) {
    final progress = session.progressIndex / session.itemIds.length;
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(Dimensions.mediumBorderRadius),
      ),
      title: Text(session.contextName),
      subtitle: Row(
        children: [
          Text("${session.progressIndex} / ${session.itemIds.length} items reviewed"),
          const SizedBox(width: Dimensions.mediumSpacing),
          Expanded(child: LinearProgressIndicator(value: progress)),
        ],
      ),
      trailing: IconButton(
        icon: Icon(AppIcons.delete(context)),
        onPressed: () => context.read<HubBloc>().add(HubDeleteSession(session.id)),
      ),
      onTap: () => DeclutterSwipeRoute(sessionId: session.id).push(context),
    );
  }
}
