import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';

@freezed
abstract class Room with _$Room {
  const factory Room({
    required int id,
    required String name,
    String? description,
    Uint8List? image,
  }) = _Room;
}
