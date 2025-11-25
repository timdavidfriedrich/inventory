// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Item implements DiagnosticableTreeMixin {
  int? get id;
  bool get isArchived;
  String get name;
  String? get notes;
  Uint8List? get image;
  List<String> get tags;
  List<String> get suggestedTags;
  ItemCondition? get condition;
  Location? get location;
  Task? get currentTask;
  DateTime? get lastDeclutter;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ItemCopyWith<Item> get copyWith =>
      _$ItemCopyWithImpl<Item>(this as Item, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Item'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('isArchived', isArchived))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('suggestedTags', suggestedTags))
      ..add(DiagnosticsProperty('condition', condition))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('currentTask', currentTask))
      ..add(DiagnosticsProperty('lastDeclutter', lastDeclutter));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Item &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality()
                .equals(other.suggestedTags, suggestedTags) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.currentTask, currentTask) ||
                other.currentTask == currentTask) &&
            (identical(other.lastDeclutter, lastDeclutter) ||
                other.lastDeclutter == lastDeclutter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isArchived,
      name,
      notes,
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(suggestedTags),
      condition,
      location,
      currentTask,
      lastDeclutter);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Item(id: $id, isArchived: $isArchived, name: $name, notes: $notes, image: $image, tags: $tags, suggestedTags: $suggestedTags, condition: $condition, location: $location, currentTask: $currentTask, lastDeclutter: $lastDeclutter)';
  }
}

/// @nodoc
abstract mixin class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) _then) =
      _$ItemCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      bool isArchived,
      String name,
      String? notes,
      Uint8List? image,
      List<String> tags,
      List<String> suggestedTags,
      ItemCondition? condition,
      Location? location,
      Task? currentTask,
      DateTime? lastDeclutter});

  $LocationCopyWith<$Res>? get location;
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._self, this._then);

  final Item _self;
  final $Res Function(Item) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? isArchived = null,
    Object? name = null,
    Object? notes = freezed,
    Object? image = freezed,
    Object? tags = null,
    Object? suggestedTags = null,
    Object? condition = freezed,
    Object? location = freezed,
    Object? currentTask = freezed,
    Object? lastDeclutter = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isArchived: null == isArchived
          ? _self.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      suggestedTags: null == suggestedTags
          ? _self.suggestedTags
          : suggestedTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      condition: freezed == condition
          ? _self.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as ItemCondition?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      currentTask: freezed == currentTask
          ? _self.currentTask
          : currentTask // ignore: cast_nullable_to_non_nullable
              as Task?,
      lastDeclutter: freezed == lastDeclutter
          ? _self.lastDeclutter
          : lastDeclutter // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_self.location!, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}

/// @nodoc

class _Item with DiagnosticableTreeMixin implements Item {
  const _Item(
      {this.id,
      this.isArchived = false,
      this.name = "",
      this.notes,
      this.image,
      final List<String> tags = const [],
      final List<String> suggestedTags = const [],
      this.condition,
      this.location,
      this.currentTask,
      this.lastDeclutter})
      : _tags = tags,
        _suggestedTags = suggestedTags;

  @override
  final int? id;
  @override
  @JsonKey()
  final bool isArchived;
  @override
  @JsonKey()
  final String name;
  @override
  final String? notes;
  @override
  final Uint8List? image;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _suggestedTags;
  @override
  @JsonKey()
  List<String> get suggestedTags {
    if (_suggestedTags is EqualUnmodifiableListView) return _suggestedTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedTags);
  }

  @override
  final ItemCondition? condition;
  @override
  final Location? location;
  @override
  final Task? currentTask;
  @override
  final DateTime? lastDeclutter;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ItemCopyWith<_Item> get copyWith =>
      __$ItemCopyWithImpl<_Item>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Item'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('isArchived', isArchived))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('suggestedTags', suggestedTags))
      ..add(DiagnosticsProperty('condition', condition))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('currentTask', currentTask))
      ..add(DiagnosticsProperty('lastDeclutter', lastDeclutter));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Item &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._suggestedTags, _suggestedTags) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.currentTask, currentTask) ||
                other.currentTask == currentTask) &&
            (identical(other.lastDeclutter, lastDeclutter) ||
                other.lastDeclutter == lastDeclutter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isArchived,
      name,
      notes,
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_suggestedTags),
      condition,
      location,
      currentTask,
      lastDeclutter);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Item(id: $id, isArchived: $isArchived, name: $name, notes: $notes, image: $image, tags: $tags, suggestedTags: $suggestedTags, condition: $condition, location: $location, currentTask: $currentTask, lastDeclutter: $lastDeclutter)';
  }
}

/// @nodoc
abstract mixin class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) _then) =
      __$ItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      bool isArchived,
      String name,
      String? notes,
      Uint8List? image,
      List<String> tags,
      List<String> suggestedTags,
      ItemCondition? condition,
      Location? location,
      Task? currentTask,
      DateTime? lastDeclutter});

  @override
  $LocationCopyWith<$Res>? get location;
}

/// @nodoc
class __$ItemCopyWithImpl<$Res> implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(this._self, this._then);

  final _Item _self;
  final $Res Function(_Item) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? isArchived = null,
    Object? name = null,
    Object? notes = freezed,
    Object? image = freezed,
    Object? tags = null,
    Object? suggestedTags = null,
    Object? condition = freezed,
    Object? location = freezed,
    Object? currentTask = freezed,
    Object? lastDeclutter = freezed,
  }) {
    return _then(_Item(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isArchived: null == isArchived
          ? _self.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      tags: null == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      suggestedTags: null == suggestedTags
          ? _self._suggestedTags
          : suggestedTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      condition: freezed == condition
          ? _self.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as ItemCondition?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      currentTask: freezed == currentTask
          ? _self.currentTask
          : currentTask // ignore: cast_nullable_to_non_nullable
              as Task?,
      lastDeclutter: freezed == lastDeclutter
          ? _self.lastDeclutter
          : lastDeclutter // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_self.location!, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}

// dart format on
