import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';

@freezed
abstract class Location with _$Location {
  const factory Location({
    required int roomId,
    int? groupId,
  }) = _Location;
}
