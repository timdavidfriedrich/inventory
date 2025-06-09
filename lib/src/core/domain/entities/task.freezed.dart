// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Task implements DiagnosticableTreeMixin {
  int get id;
  int get itemId;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskCopyWith<Task> get copyWith =>
      _$TaskCopyWithImpl<Task>(this as Task, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Task'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('itemId', itemId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Task &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, itemId);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Task(id: $id, itemId: $itemId)';
  }
}

/// @nodoc
abstract mixin class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) _then) =
      _$TaskCopyWithImpl;
  @useResult
  $Res call({int id, int itemId});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._self, this._then);

  final Task _self;
  final $Res Function(Task) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class TossTask with DiagnosticableTreeMixin implements Task {
  const TossTask({required this.id, required this.itemId});

  @override
  final int id;
  @override
  final int itemId;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TossTaskCopyWith<TossTask> get copyWith =>
      _$TossTaskCopyWithImpl<TossTask>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Task.toss'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('itemId', itemId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TossTask &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, itemId);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Task.toss(id: $id, itemId: $itemId)';
  }
}

/// @nodoc
abstract mixin class $TossTaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory $TossTaskCopyWith(TossTask value, $Res Function(TossTask) _then) =
      _$TossTaskCopyWithImpl;
  @override
  @useResult
  $Res call({int id, int itemId});
}

/// @nodoc
class _$TossTaskCopyWithImpl<$Res> implements $TossTaskCopyWith<$Res> {
  _$TossTaskCopyWithImpl(this._self, this._then);

  final TossTask _self;
  final $Res Function(TossTask) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? itemId = null,
  }) {
    return _then(TossTask(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class MoveTask with DiagnosticableTreeMixin implements Task {
  const MoveTask(
      {required this.id, required this.itemId, required this.destination});

  @override
  final int id;
  @override
  final int itemId;
  final Location destination;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MoveTaskCopyWith<MoveTask> get copyWith =>
      _$MoveTaskCopyWithImpl<MoveTask>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Task.move'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('itemId', itemId))
      ..add(DiagnosticsProperty('destination', destination));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MoveTask &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.destination, destination) ||
                other.destination == destination));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, itemId, destination);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Task.move(id: $id, itemId: $itemId, destination: $destination)';
  }
}

/// @nodoc
abstract mixin class $MoveTaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory $MoveTaskCopyWith(MoveTask value, $Res Function(MoveTask) _then) =
      _$MoveTaskCopyWithImpl;
  @override
  @useResult
  $Res call({int id, int itemId, Location destination});

  $LocationCopyWith<$Res> get destination;
}

/// @nodoc
class _$MoveTaskCopyWithImpl<$Res> implements $MoveTaskCopyWith<$Res> {
  _$MoveTaskCopyWithImpl(this._self, this._then);

  final MoveTask _self;
  final $Res Function(MoveTask) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? destination = null,
  }) {
    return _then(MoveTask(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
      destination: null == destination
          ? _self.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Location,
    ));
  }

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get destination {
    return $LocationCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

// dart format on
