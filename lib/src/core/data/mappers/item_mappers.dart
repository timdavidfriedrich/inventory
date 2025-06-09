import 'dart:typed_data';

import 'package:inventory/src/core/data/models/ldb_item.dart';
import 'package:inventory/src/core/domain/entities/item.dart';

extension LdbItemMapper on LdbItem {
  Item toItem() {
    return Item(
      id: id,
      name: name,
      image: imageBytes != null ? Uint8List.fromList(imageBytes!) : null,
      tags: tags,
      condition: condition != null ? ItemCondition.values[condition!] : null,
      description: description,
      // The location relation would need its own mapping logic.
      location: null,
    );
  }
}

extension ItemMapper on Item {
  LdbItem toLdbItem() {
    final ldbItem = LdbItem(
      name: name,
      imageBytes: image,
      tags: tags,
      condition: condition?.index,
      description: description,
    );
    if (id != 0) {
      ldbItem.id = id;
    }
    return ldbItem;
  }
}
