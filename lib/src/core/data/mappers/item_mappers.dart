import 'dart:typed_data';

import 'package:inventory/src/core/data/models/ldb_item.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/domain/entities/task.dart';

extension LdbItemMapper on LdbItem {
  Item toItem() {
    return Item(
      id: id,
      isArchived: isArchived,
      name: name,
      image: imageBytes != null ? Uint8List.fromList(imageBytes!) : null,
      tags: tags,
      suggestedTags: suggestedTags,
      condition: condition != null ? ItemCondition.values[condition!] : null,
      notes: notes,
      // TODO: location relation needs its own mapping logic
      location: null,
      currentTask: currentTask != null ? Task.values[currentTask!] : null,
      lastDeclutter: lastDeclutter,
    );
  }
}

extension ItemMapper on Item {
  LdbItem? toLdbItem() {
    if (name.isEmpty) {
      return null;
    }
    // TODO: Map location
    final ldbItem = LdbItem(
      name: name,
      isArchived: isArchived,
      imageBytes: image,
      tags: tags,
      suggestedTags: suggestedTags,
      condition: condition?.index,
      notes: notes,
      currentTask: currentTask?.index,
      lastDeclutter: lastDeclutter,
    );
    // Only set id, if not 0
    final itemId = id;
    if (itemId != null && itemId > 0) {
      ldbItem.id = itemId;
    }
    return ldbItem;
  }
}
