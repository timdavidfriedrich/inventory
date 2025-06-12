import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';

sealed class OverviewEvent {
  const OverviewEvent();
}

class OverviewItemsUpdated extends OverviewEvent {
  final AppResult<List<Item>> result;
  const OverviewItemsUpdated(this.result);
}

class OverviewSaveItem extends OverviewEvent {
  final Item item;
  const OverviewSaveItem(this.item);
}

class OverviewDeleteItem extends OverviewEvent {
  final Item item;
  const OverviewDeleteItem(this.item);
}
