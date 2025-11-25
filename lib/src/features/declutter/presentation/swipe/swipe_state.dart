import 'package:inventory/src/core/domain/entities/item.dart';

sealed class SwipeState {
  const SwipeState();
}

class SwipeInitial extends SwipeState {
  const SwipeInitial();
}

class SwipeLoading extends SwipeState {
  const SwipeLoading();
}

class SwipeItemLoadSuccess extends SwipeState {
  final List<Item> items;
  final int currentIndex;

  const SwipeItemLoadSuccess({
    required this.items,
    required this.currentIndex,
  });

  bool get canUndo => currentIndex > 0;

  Item get currentItem => items[currentIndex];
  int get totalItems => items.length;

  SwipeItemLoadSuccess copyWith({
    List<Item>? items,
    int? currentIndex,
  }) {
    return SwipeItemLoadSuccess(
      items: items ?? this.items,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

class SwipeSessionFinished extends SwipeState {
  const SwipeSessionFinished();
}

class SwipeError extends SwipeState {
  final String message;
  const SwipeError(this.message);
}
