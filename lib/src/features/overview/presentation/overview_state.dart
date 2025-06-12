import 'package:inventory/src/core/domain/entities/item.dart';

sealed class OverviewState {
  const OverviewState();
}

class OverviewLoading extends OverviewState {
  const OverviewLoading();
}

class OverviewSuccess extends OverviewState {
  final List<Item> items;

  const OverviewSuccess(this.items);
}

class OverviewError extends OverviewState {
  final String message;

  const OverviewError(this.message);
}
