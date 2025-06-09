import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory/src/core/domain/entities/location.dart';

part 'item.freezed.dart';

@freezed
abstract class Item with _$Item {
  const factory Item({
    required int id,
    required String name,
    String? description,
    Uint8List? image,
    @Default([]) List<String> tags,
    ItemCondition? condition,
    Location? location,
  }) = _Item;
}

enum ItemCondition { pristine, good, fair, worn, damaged }
