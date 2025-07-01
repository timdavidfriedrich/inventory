import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:inventory/service_locator.dart';
import 'package:inventory/src/core/domain/entities/scan_result.dart';
import 'package:inventory/src/core/presentation/app_router.dart';
import 'package:inventory/src/core/presentation/utils/app_icons.dart';
import 'package:inventory/src/core/presentation/utils/dimensions.dart';
import 'package:inventory/src/core/presentation/error_screen.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';
import 'package:inventory/src/core/presentation/loading_screen.dart';
import 'package:inventory/src/core/presentation/widgets/archive_item_confirm_dialog.dart';
import 'package:inventory/src/core/presentation/widgets/floating_toolbar.dart';
import 'package:inventory/src/features/details/presentation/details_bloc.dart';
import 'package:inventory/src/features/details/presentation/details_event.dart';
import 'package:inventory/src/features/details/presentation/details_state.dart';
import 'package:inventory/src/features/details/presentation/widgets/add_tag_dialog.dart';

const _imageSize = 200.0;

class DetailsScreen extends StatelessWidget {
  final int? id;
  final ScanResultWithImage? scanResult;
  const DetailsScreen({
    this.id,
    this.scanResult,
    super.key,
  });

  static const String routeName = "/details";
  static const String routeNameFromScan = "/detailsFromScan";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsBloc>(
      create: (context) => sl<DetailsBloc>()..add(DetailsInit(id: id, scanResult: scanResult)),
      child: BlocConsumer<DetailsBloc, DetailsState>(
        listenWhen: (previous, current) => current is DetailsDone,
        listener: (context, state) => context.go(HomeRoute().location),
        builder: (context, state) => switch (state) {
          DetailsInitial() => const LoadingScreen(),
          DetailsLoading() => const LoadingScreen(),
          DetailsError() => ErrorScreen(message: state.message),
          DetailsSuccess() => const _DetailsScreen(),
          DetailsDone() => const SizedBox.shrink(),
        },
      ),
    );
  }
}

class _DetailsScreen extends HookWidget {
  const _DetailsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isIos
          ? CupertinoNavigationBar()
          : AppBar(
              title: Text(context.s.screen_details),
            ),
      body: ListView(
        padding: const EdgeInsets.only(
          left: Dimensions.semiLargeSpacing,
          right: Dimensions.semiLargeSpacing,
          top: Dimensions.mediumSpacing,
          bottom: Dimensions.scrollEndSpacing,
        ),
        children: const [
          _Image(),
          SizedBox(height: Dimensions.largeSpacing),
          _NameSection(),
          SizedBox(height: Dimensions.largeSpacing),
          _TagsSection(),
          SizedBox(height: Dimensions.largeSpacing),
          _NotesSection(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const _FloatingActionButtons(),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DetailsBloc>().state;
    if (state is! DetailsSuccess) {
      return const SizedBox.shrink();
    }
    final imageData = state.item.image;
    return Center(
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: _imageSize,
        height: _imageSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.smallBorderRadius),
          border: Border.all(
            color: context.c.outlineVariant,
            width: Dimensions.semiLargeBorderWidth,
          ),
          color: Theme.of(context).colorScheme.surface,
          image: imageData == null
              ? null
              : DecorationImage(
                  fit: BoxFit.cover,
                  image: MemoryImage(imageData),
                ),
        ),
        child: _OpenCameraButton(),
      ),
    );
  }
}

class _OpenCameraButton extends StatelessWidget {
  const _OpenCameraButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      // * Subtracting 2 is a hotfix to avoid the border being too wide
      borderRadius: BorderRadius.circular(Dimensions.smallBorderRadius - 2),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          // ! TODO: Navigate to CameraScreen, await image and update the item
          await CameraRoute().push(context).then((imageData) async {
            if (context.mounted) {
              context.read<DetailsBloc>().add(DetailsUpdateImage(imageData));
            }
          });
        },
        child: Icon(
          AppIcons.camera(context),
          size: Dimensions.largeIconSize,
        ),
      ),
    );
  }
}

class _NameSection extends HookWidget {
  const _NameSection();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DetailsBloc>().state;
    if (state is! DetailsSuccess) {
      return const SizedBox.shrink();
    }
    final nameController = useTextEditingController(text: state.item.name);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(context.s.details_name, style: context.t.titleMedium),
        const SizedBox(height: Dimensions.smallSpacing),
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: context.s.details_name_hint,
          ),
          onChanged: (value) {
            context.read<DetailsBloc>().add(DetailsUpdateName(value));
          },
        ),
      ],
    );
  }
}

class _NotesSection extends HookWidget {
  const _NotesSection();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DetailsBloc>().state;
    if (state is! DetailsSuccess) {
      return const SizedBox.shrink();
    }
    final notesController = useTextEditingController(text: state.item.notes);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(context.s.details_notes, style: context.t.titleMedium),
        const SizedBox(height: Dimensions.smallSpacing),
        TextField(
          controller: notesController,
          decoration: InputDecoration(
            hintText: context.s.details_notes_hint,
          ),
          maxLines: 3,
          onChanged: (value) {
            context.read<DetailsBloc>().add(DetailsUpdateNotes(value));
          },
        ),
      ],
    );
  }
}

class _TagsSection extends StatelessWidget {
  const _TagsSection();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DetailsBloc>().state;
    if (state is! DetailsSuccess) {
      return const SizedBox.shrink();
    }
    final item = state.item;
    final suggestedTags = item.suggestedTags;
    final tags = item.tags;
    final tagsToShow = (suggestedTags + tags).toSet();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(context.s.details_tags, style: context.t.titleMedium),
        const SizedBox(height: Dimensions.extraSmallSpacing),
        Wrap(
          spacing: Dimensions.smallSpacing,
          runSpacing: Dimensions.smallSpacing,
          children: List.generate(
            tagsToShow.length + 1,
            (index) {
              if (index == tagsToShow.length) {
                return _AddTagButton();
              }
              final tag = tagsToShow.elementAt(index);
              return _TagChip(
                tag: tag,
                isSelected: item.tags.contains(tag),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _AddTagButton extends StatelessWidget {
  const _AddTagButton();

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: () {
        AddTagDialog.show(context).then((tag) {
          if (tag != null && tag.isNotEmpty && context.mounted) {
            context.read<DetailsBloc>().add(DetailsAddTag(tag));
          }
        });
      },
      label: Icon(
        AppIcons.add(context),
        size: context.t.titleLarge?.fontSize,
        applyTextScaling: true,
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String tag;
  final bool isSelected;
  const _TagChip({
    required this.tag,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      avatar: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        opacity: isSelected ? 0.0 : 1.0,
        child: Icon(AppIcons.ai(context)),
      ),
      label: Text(tag),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          context.read<DetailsBloc>().add(DetailsAddTag(tag));
        } else {
          context.read<DetailsBloc>().add(DetailsRemoveTag(tag));
        }
      },
    );
  }
}

class _FloatingActionButtons extends StatelessWidget {
  const _FloatingActionButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: Dimensions.mediumSpacing),
        FloatingToolbar(
          children: [
            FloatingToolbarButton(
              onPressed: () {
                ArchiveItemConfirmDialog.show(context).then((confirmed) {
                  if (confirmed == true && context.mounted) {
                    context.read<DetailsBloc>().add(DetailsArchiveItem());
                  }
                });
              },
              child: Icon(AppIcons.archive(context), color: context.c.error),
            ),
            const FloatingToolbarDivider(),
            FloatingToolbarButton(
              onPressed: () => context.read<DetailsBloc>().add(DetailsManageView()),
              child: Icon(AppIcons.declutter(context)),
            ),
          ],
        ),
        const Spacer(),
        FloatingActionButton(
          onPressed: () => context.read<DetailsBloc>().add(DetailsSaveItem()),
          child: Icon(AppIcons.save(context)),
        ),
        const SizedBox(width: Dimensions.mediumSpacing),
      ],
    );
  }
}
