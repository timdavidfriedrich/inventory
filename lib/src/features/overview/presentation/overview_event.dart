import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';

sealed class OverviewEvent {
  const OverviewEvent();
}

class OverviewRefreshItems extends OverviewEvent {
  final AppResult<List<Item>> result;
  const OverviewRefreshItems(this.result);
}

class OverviewDeleteItem extends OverviewEvent {
  final Item item;
  const OverviewDeleteItem(this.item);
}
