import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group.freezed.dart';

@freezed
abstract class Group with _$Group {
  const factory Group({
    required int id,
    required String name,
    String? description,
    Uint8List? image,
    int? subGroupId,
  }) = _Group;
}
