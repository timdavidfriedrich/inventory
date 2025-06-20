import 'package:inventory/src/core/domain/entities/item.dart';

sealed class DetailsState {
  const DetailsState();
}

class DetailsInitial extends DetailsState {
  const DetailsInitial();
}

class DetailsLoading extends DetailsState {
  const DetailsLoading();
}

class DetailsSuccess extends DetailsState {
  final Item item;
  const DetailsSuccess({
    required this.item,
  });

  DetailsSuccess copyWith({
    Item? item,
  }) {
    return DetailsSuccess(
      item: item ?? this.item,
    );
  }
}

class DetailsError extends DetailsState {
  final String message;
  const DetailsError({required this.message});
}

class DetailsDone extends DetailsState {
  const DetailsDone();
}
