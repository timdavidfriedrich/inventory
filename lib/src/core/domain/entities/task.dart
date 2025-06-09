import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory/src/core/domain/entities/location.dart';

part 'task.freezed.dart';

@freezed
sealed class Task with _$Task {
  const factory Task.toss({
    required int id,
    required int itemId,
  }) = TossTask;

  const factory Task.move({
    required int id,
    required int itemId,
    required Location destination,
  }) = MoveTask;
}
