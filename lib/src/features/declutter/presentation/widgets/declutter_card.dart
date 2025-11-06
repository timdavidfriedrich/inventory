import 'package:flutter/material.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';
import 'package:inventory/src/core/presentation/utils/dimensions.dart';

const _cardPadding = Dimensions.semiLargeSpacing;
const _maxAngle = 15;

class DeclutterCard extends StatefulWidget {
  final Item item;
  final bool isTopCard;
  final double dragProgress;
  final VoidCallback onSwipeLeft;
  final VoidCallback onSwipeRight;
  final VoidCallback onSwipeUp;
  final ValueChanged<double> onDragUpdate;

  const DeclutterCard({
    super.key,
    required this.item,
    required this.isTopCard,
    required this.dragProgress,
    required this.onSwipeLeft,
    required this.onSwipeRight,
    required this.onSwipeUp,
    required this.onDragUpdate,
  });

  @override
  State<DeclutterCard> createState() => _DeclutterCardState();
}

class _DeclutterCardState extends State<DeclutterCard> with TickerProviderStateMixin {
  Offset _position = Offset.zero;
  double _angle = 0.0;
  Size _screenSize = Size.zero;

  late final AnimationController _animationController;
  Animation<Offset>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animationController.addListener(() {
      setState(() {
        _position = _animation!.value;
        _updateAngle();
      });
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
        widget.onDragUpdate(0.0);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_screenSize == Size.zero) {
      _screenSize = MediaQuery.of(context).size;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateAngle() {
    _angle = (_maxAngle * (_position.dx / _screenSize.width)) * (3.14159 / 180);
  }

  void _updateProgress() {
    // TODO: Check if pixel distance or percentage is better
    final progress = (_position.dx.abs() / 120).clamp(0.0, 1.0);
    widget.onDragUpdate(progress);
  }

  void _onPanStart(DragStartDetails details) {
    // TODO: Implement _onPanStart if needed
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (!widget.isTopCard) return;
    setState(() {
      _position += details.delta;
      _updateAngle();
      _updateProgress();
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (!widget.isTopCard) return;

    final double swipeThreshold = 120;
    final double flingVelocity = details.velocity.pixelsPerSecond.dx;

    if (_position.dx.abs() > swipeThreshold || flingVelocity.abs() > 1000) {
      final bool swipeRight = _position.dx > 0 || flingVelocity > 1000;
      final bool swipeLeft = _position.dx < 0 || flingVelocity < -1000;
      final bool swipeUp = _position.dy < -swipeThreshold;

      final double endX = swipeRight ? _screenSize.width * 1.5 : -_screenSize.width * 1.5;
      final double endY = swipeUp ? -_screenSize.height * 1.5 : _position.dy;

      _animation = Tween<Offset>(
        begin: _position,
        end: Offset(endX, endY),
      ).animate(_animationController);

      void statusListener(AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          if (swipeUp) {
            widget.onSwipeUp();
          } else if (swipeRight) {
            widget.onSwipeRight();
          } else if (swipeLeft) {
            widget.onSwipeLeft();
          }
          _animationController.removeStatusListener(statusListener);
        }
      }

      _animationController.addStatusListener(statusListener);
      _animationController.forward(from: 0);
    } else {
      _animation = Tween<Offset>(
        begin: _position,
        end: Offset.zero,
      ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
      );
      _animationController.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final scale = 0.9 + (widget.dragProgress * 0.1);
    final dragTransform = Matrix4.identity()
      ..translate(_position.dx, _position.dy)
      ..rotateZ(_angle);

    final card = Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: context.c.surfaceContainer,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (widget.item.image != null)
                  Image.memory(
                    widget.item.image!,
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
                        context.c.surfaceContainer,
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
                    widget.item.name,
                    style: context.t.headlineSmall,
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
                  style: context.t.titleMedium,
                ),
                const SizedBox(height: Dimensions.largeSpacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: () {},
                        // TODO: Localize
                        child: const Text("Keep"),
                      ),
                    ),
                    const SizedBox(width: Dimensions.mediumSpacing),
                    OutlinedButton(
                      onPressed: () {},
                      // TODO: Localize
                      child: const Text("Move"),
                    ),
                    const SizedBox(width: Dimensions.mediumSpacing),
                    Expanded(
                      child: FilledButton(
                        onPressed: () {},
                        // TODO: Localize
                        child: const Text("Toss"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimensions.largeSpacing),
              ],
            ),
          ),
        ],
      ),
    );

    return Transform.scale(
      scale: widget.isTopCard ? 1.0 : scale,
      alignment: Alignment.center,
      child: Transform(
        transform: widget.isTopCard ? dragTransform : Matrix4.identity(),
        alignment: Alignment.center,
        child: widget.isTopCard
            ? GestureDetector(
                onPanStart: _onPanStart,
                onPanUpdate: _onPanUpdate,
                onPanEnd: _onPanEnd,
                child: card,
              )
            : card,
      ),
    );
  }
}
