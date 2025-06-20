import 'package:inventory/src/core/domain/entities/scan_result.dart';

sealed class DetailsEvent {
  const DetailsEvent();
}

class DetailsInit extends DetailsEvent {
  final int? id;
  final ScanResultWithImage? scanResult;
  const DetailsInit({
    this.id,
    this.scanResult,
  });
}

class DetailsUpdateName extends DetailsEvent {
  final String name;
  const DetailsUpdateName(this.name);
}

class DetailsUpdateNotes extends DetailsEvent {
  final String notes;
  const DetailsUpdateNotes(this.notes);
}

class DetailsAddTag extends DetailsEvent {
  final String tag;
  const DetailsAddTag(this.tag);
}

class DetailsRemoveTag extends DetailsEvent {
  final String tag;
  const DetailsRemoveTag(this.tag);
}

class DetailsSaveItem extends DetailsEvent {
  const DetailsSaveItem();
}

class DetailsArchiveItem extends DetailsEvent {
  const DetailsArchiveItem();
}

class DetailsManageView extends DetailsEvent {
  const DetailsManageView();
}
