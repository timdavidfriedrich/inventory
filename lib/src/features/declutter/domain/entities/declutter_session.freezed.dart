// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'declutter_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeclutterSession {
  int? get id;
  String get contextName;
  List<int> get itemIds;
  int get progressIndex;
  DeclutterSessionStatus get status;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  /// Create a copy of DeclutterSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeclutterSessionCopyWith<DeclutterSession> get copyWith =>
      _$DeclutterSessionCopyWithImpl<DeclutterSession>(
          this as DeclutterSession, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeclutterSession &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contextName, contextName) ||
                other.contextName == contextName) &&
            const DeepCollectionEquality().equals(other.itemIds, itemIds) &&
            (identical(other.progressIndex, progressIndex) ||
                other.progressIndex == progressIndex) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      contextName,
      const DeepCollectionEquality().hash(itemIds),
      progressIndex,
      status,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'DeclutterSession(id: $id, contextName: $contextName, itemIds: $itemIds, progressIndex: $progressIndex, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $DeclutterSessionCopyWith<$Res> {
  factory $DeclutterSessionCopyWith(
          DeclutterSession value, $Res Function(DeclutterSession) _then) =
      _$DeclutterSessionCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String contextName,
      List<int> itemIds,
      int progressIndex,
      DeclutterSessionStatus status,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$DeclutterSessionCopyWithImpl<$Res>
    implements $DeclutterSessionCopyWith<$Res> {
  _$DeclutterSessionCopyWithImpl(this._self, this._then);

  final DeclutterSession _self;
  final $Res Function(DeclutterSession) _then;

  /// Create a copy of DeclutterSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? contextName = null,
    Object? itemIds = null,
    Object? progressIndex = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      contextName: null == contextName
          ? _self.contextName
          : contextName // ignore: cast_nullable_to_non_nullable
              as String,
      itemIds: null == itemIds
          ? _self.itemIds
          : itemIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      progressIndex: null == progressIndex
          ? _self.progressIndex
          : progressIndex // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeclutterSessionStatus,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _DeclutterSession implements DeclutterSession {
  const _DeclutterSession(
      {this.id,
      required this.contextName,
      required final List<int> itemIds,
      this.progressIndex = 0,
      this.status = DeclutterSessionStatus.active,
      this.createdAt,
      this.updatedAt})
      : _itemIds = itemIds;

  @override
  final int? id;
  @override
  final String contextName;
  final List<int> _itemIds;
  @override
  List<int> get itemIds {
    if (_itemIds is EqualUnmodifiableListView) return _itemIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemIds);
  }

  @override
  @JsonKey()
  final int progressIndex;
  @override
  @JsonKey()
  final DeclutterSessionStatus status;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  /// Create a copy of DeclutterSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeclutterSessionCopyWith<_DeclutterSession> get copyWith =>
      __$DeclutterSessionCopyWithImpl<_DeclutterSession>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeclutterSession &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contextName, contextName) ||
                other.contextName == contextName) &&
            const DeepCollectionEquality().equals(other._itemIds, _itemIds) &&
            (identical(other.progressIndex, progressIndex) ||
                other.progressIndex == progressIndex) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      contextName,
      const DeepCollectionEquality().hash(_itemIds),
      progressIndex,
      status,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'DeclutterSession(id: $id, contextName: $contextName, itemIds: $itemIds, progressIndex: $progressIndex, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$DeclutterSessionCopyWith<$Res>
    implements $DeclutterSessionCopyWith<$Res> {
  factory _$DeclutterSessionCopyWith(
          _DeclutterSession value, $Res Function(_DeclutterSession) _then) =
      __$DeclutterSessionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String contextName,
      List<int> itemIds,
      int progressIndex,
      DeclutterSessionStatus status,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$DeclutterSessionCopyWithImpl<$Res>
    implements _$DeclutterSessionCopyWith<$Res> {
  __$DeclutterSessionCopyWithImpl(this._self, this._then);

  final _DeclutterSession _self;
  final $Res Function(_DeclutterSession) _then;

  /// Create a copy of DeclutterSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? contextName = null,
    Object? itemIds = null,
    Object? progressIndex = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_DeclutterSession(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      contextName: null == contextName
          ? _self.contextName
          : contextName // ignore: cast_nullable_to_non_nullable
              as String,
      itemIds: null == itemIds
          ? _self._itemIds
          : itemIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      progressIndex: null == progressIndex
          ? _self.progressIndex
          : progressIndex // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeclutterSessionStatus,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
