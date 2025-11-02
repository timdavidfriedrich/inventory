import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inventory/service_locator.dart';
import 'package:inventory/src/core/domain/entities/scan_result.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';
import 'package:inventory/src/core/presentation/loading_screen.dart';
import 'package:inventory/src/core/presentation/utils/dimensions.dart';
import 'package:inventory/src/features/scan/presentation/scan_bloc.dart';
import 'package:inventory/src/features/scan/presentation/scan_event.dart';
import 'package:inventory/src/features/scan/presentation/scan_state.dart';
import 'package:log/log.dart';

class ScanScreen extends StatelessWidget {
  final Uint8List imageData;
  const ScanScreen({
    required this.imageData,
    super.key,
  });

  static const String routeName = "/scan";

  @override
  Widget build(BuildContext context) {
    final bloc = sl<ScanBloc>();
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<ScanBloc, ScanState>(
        bloc: bloc
          ..add(ScanGetSuggestions(
            imageData,
            languageName: context.s.localeName,
          )),
        listenWhen: (previous, current) => previous is ScanLoading && current is ScanError,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.s.scan_failed_message),
              duration: Duration(seconds: 3),
            ),
          );

          WidgetsBinding.instance.addPostFrameCallback((_) {
            try {
              if (context.mounted) {
                context.pop(null);
              }
            } catch (e) {
              Log.warning("Error popping: $e");
            }
          });
        },
        builder: (context, state) {
          return switch (state) {
            ScanLoading() => const LoadingScreen(),
            ScanSuccess() => const _ScanSuccessScreen(),
            ScanError() => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}

class _ScanSuccessScreen extends StatelessWidget {
  const _ScanSuccessScreen();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ScanBloc>().state;
    if (state is! ScanSuccess) return const SizedBox.shrink();
    return Scaffold(
      appBar: context.isIos ? CupertinoNavigationBar() : AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.largeSpacing,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: Dimensions.largeSpacing),
            _PictureBox(),
            SizedBox(height: Dimensions.mediumSpacing),
            _ScanResultsList(),
            SizedBox(height: Dimensions.ultraLargeSpacing),
          ],
        ),
      ),
    );
  }
}

class _ScanResultsList extends StatelessWidget {
  const _ScanResultsList();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ScanBloc>().state;
    if (state is! ScanSuccess) return const SizedBox.shrink();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.scanResults.length,
      itemBuilder: (context, index) {
        final scanResult = state.scanResults[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: Dimensions.extraSmallSpacing),
          child: _ScanResultsListEntry(scanResult: scanResult),
        );
      },
    );
  }
}

class _ScanResultsListEntry extends StatelessWidget {
  final ScanResult scanResult;
  const _ScanResultsListEntry({required this.scanResult});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(scanResult.name),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.mediumBorderRadius),
      ),
      tileColor: Theme.of(context).colorScheme.surfaceContainer,
      onTap: () => context.read<ScanBloc>().add(
            ScanSelectSuggestedName(
              scanResult: scanResult,
              onScanResultSelected: (result) {
                context.pop(result);
              },
            ),
          ),
    );
  }
}

class _PictureBox extends StatelessWidget {
  const _PictureBox();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ScanBloc>().state;
    if (state is! ScanSuccess) return const SizedBox.shrink();
    final imageData = state.imageData;
    if (imageData == null || imageData.isEmpty) return const SizedBox.shrink();
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimensions.largeBorderRadius),
        child: Image.memory(
          imageData,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
