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
  final Item item;
  final int currentIndex;
  final int totalItems;

  const SwipeItemLoadSuccess({
    required this.item,
    required this.currentIndex,
    required this.totalItems,
  });
}

class SwipeSessionFinished extends SwipeState {
  const SwipeSessionFinished();
}

class SwipeError extends SwipeState {
  final String message;
  const SwipeError(this.message);
}
