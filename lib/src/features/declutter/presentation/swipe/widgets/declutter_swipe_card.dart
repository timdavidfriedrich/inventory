import 'package:flutter/material.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';
import 'package:inventory/src/core/presentation/utils/dimensions.dart';

const _cardPadding = Dimensions.semiLargeSpacing;

class DeclutterSwipeCard extends StatelessWidget {
  final Item item;
  const DeclutterSwipeCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.brightnessOf(context) == Brightness.dark
        ? context.c.surfaceContainer
        : context.c.inverseSurface;

    final onCardColor = Theme.brightnessOf(context) == Brightness.dark
        ? context.c.onSurface
        : context.c.onInverseSurface;

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.mediumBorderRadius),
      ),
      color: cardColor,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (item.image != null)
                  Image.memory(
                    item.image!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stack) {
                      return const Center(child: Icon(Icons.broken_image, color: Colors.grey));
                    },
                  ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      stops: const [0.1, 1.0],
                      colors: [
                        cardColor,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: _cardPadding,
                  right: _cardPadding,
                  child: Text(
                    item.name,
                    style: context.t.headlineSmall?.copyWith(color: onCardColor),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: _cardPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: Dimensions.smallSpacing),
                Text(
                  // TODO: Replace with actual room name
                  "Badezimmer",
                  style: context.t.titleMedium?.copyWith(color: onCardColor),
                ),
                const SizedBox(height: Dimensions.largeSpacing),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
