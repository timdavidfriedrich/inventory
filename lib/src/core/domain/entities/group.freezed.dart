// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Group implements DiagnosticableTreeMixin {
  int get id;
  String get name;
  String? get description;
  Uint8List? get image;
  int? get subGroupId;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupCopyWith<Group> get copyWith =>
      _$GroupCopyWithImpl<Group>(this as Group, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Group'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('subGroupId', subGroupId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Group &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            (identical(other.subGroupId, subGroupId) ||
                other.subGroupId == subGroupId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      const DeepCollectionEquality().hash(image), subGroupId);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Group(id: $id, name: $name, description: $description, image: $image, subGroupId: $subGroupId)';
  }
}

/// @nodoc
abstract mixin class $GroupCopyWith<$Res> {
  factory $GroupCopyWith(Group value, $Res Function(Group) _then) =
      _$GroupCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      Uint8List? image,
      int? subGroupId});
}

/// @nodoc
class _$GroupCopyWithImpl<$Res> implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._self, this._then);

  final Group _self;
  final $Res Function(Group) _then;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? subGroupId = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      subGroupId: freezed == subGroupId
          ? _self.subGroupId
          : subGroupId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _Group with DiagnosticableTreeMixin implements Group {
  const _Group(
      {required this.id,
      required this.name,
      this.description,
      this.image,
      this.subGroupId});

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final Uint8List? image;
  @override
  final int? subGroupId;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupCopyWith<_Group> get copyWith =>
      __$GroupCopyWithImpl<_Group>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Group'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('subGroupId', subGroupId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Group &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            (identical(other.subGroupId, subGroupId) ||
                other.subGroupId == subGroupId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      const DeepCollectionEquality().hash(image), subGroupId);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Group(id: $id, name: $name, description: $description, image: $image, subGroupId: $subGroupId)';
  }
}

/// @nodoc
abstract mixin class _$GroupCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$GroupCopyWith(_Group value, $Res Function(_Group) _then) =
      __$GroupCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      Uint8List? image,
      int? subGroupId});
}

/// @nodoc
class __$GroupCopyWithImpl<$Res> implements _$GroupCopyWith<$Res> {
  __$GroupCopyWithImpl(this._self, this._then);

  final _Group _self;
  final $Res Function(_Group) _then;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? subGroupId = freezed,
  }) {
    return _then(_Group(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      subGroupId: freezed == subGroupId
          ? _self.subGroupId
          : subGroupId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
