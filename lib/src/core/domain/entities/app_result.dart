import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_result.freezed.dart';

@freezed
sealed class AppResult<T> with _$AppResult<T> {
  const factory AppResult.success(T data) = Success<T>;
  const factory AppResult.error(Exception error) = Error<T>;
  const factory AppResult.empty() = Empty<T>;
}
