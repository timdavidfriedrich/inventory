import 'dart:typed_data';

import 'package:inventory/src/core/data/models/ldb_item.dart';
import 'package:inventory/src/core/domain/entities/item.dart';

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
      // The location relation would need its own mapping logic.
      location: null,
    );
  }
}

extension ItemMapper on Item {
  LdbItem? toLdbItem() {
    // If name is null or empty, return null
    if (name.isEmpty) {
      return null;
    }
    final ldbItem = LdbItem(
      name: name,
      isArchived: isArchived,
      imageBytes: image,
      tags: tags,
      suggestedTags: suggestedTags,
      condition: condition?.index,
      notes: notes,
    );
    // Only set id, if not 0
    final itemId = id;
    if (itemId != null && itemId > 0) {
      ldbItem.id = itemId;
    }
    return ldbItem;
  }
}
