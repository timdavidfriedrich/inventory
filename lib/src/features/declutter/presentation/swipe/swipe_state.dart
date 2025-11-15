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

  Item get currentItem => items[currentIndex];
  int get totalItems => items.length;
  List<Item> get remainingItems => items.sublist(currentIndex);
}

class SwipeSessionFinished extends SwipeState {
  const SwipeSessionFinished();
}

class SwipeError extends SwipeState {
  final String message;
  const SwipeError(this.message);
}
