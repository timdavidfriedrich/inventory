// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScanResult {
  String get name;
  List<String> get suggestedTags;

  /// Create a copy of ScanResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScanResultCopyWith<ScanResult> get copyWith =>
      _$ScanResultCopyWithImpl<ScanResult>(this as ScanResult, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScanResult &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other.suggestedTags, suggestedTags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(suggestedTags));

  @override
  String toString() {
    return 'ScanResult(name: $name, suggestedTags: $suggestedTags)';
  }
}

/// @nodoc
abstract mixin class $ScanResultCopyWith<$Res> {
  factory $ScanResultCopyWith(
          ScanResult value, $Res Function(ScanResult) _then) =
      _$ScanResultCopyWithImpl;
  @useResult
  $Res call({String name, List<String> suggestedTags});
}

/// @nodoc
class _$ScanResultCopyWithImpl<$Res> implements $ScanResultCopyWith<$Res> {
  _$ScanResultCopyWithImpl(this._self, this._then);

  final ScanResult _self;
  final $Res Function(ScanResult) _then;

  /// Create a copy of ScanResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? suggestedTags = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedTags: null == suggestedTags
          ? _self.suggestedTags
          : suggestedTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _ScanResult implements ScanResult {
  const _ScanResult(
      {this.name = "", final List<String> suggestedTags = const []})
      : _suggestedTags = suggestedTags;

  @override
  @JsonKey()
  final String name;
  final List<String> _suggestedTags;
  @override
  @JsonKey()
  List<String> get suggestedTags {
    if (_suggestedTags is EqualUnmodifiableListView) return _suggestedTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedTags);
  }

  /// Create a copy of ScanResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScanResultCopyWith<_ScanResult> get copyWith =>
      __$ScanResultCopyWithImpl<_ScanResult>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScanResult &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._suggestedTags, _suggestedTags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_suggestedTags));

  @override
  String toString() {
    return 'ScanResult(name: $name, suggestedTags: $suggestedTags)';
  }
}

/// @nodoc
abstract mixin class _$ScanResultCopyWith<$Res>
    implements $ScanResultCopyWith<$Res> {
  factory _$ScanResultCopyWith(
          _ScanResult value, $Res Function(_ScanResult) _then) =
      __$ScanResultCopyWithImpl;
  @override
  @useResult
  $Res call({String name, List<String> suggestedTags});
}

/// @nodoc
class __$ScanResultCopyWithImpl<$Res> implements _$ScanResultCopyWith<$Res> {
  __$ScanResultCopyWithImpl(this._self, this._then);

  final _ScanResult _self;
  final $Res Function(_ScanResult) _then;

  /// Create a copy of ScanResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? suggestedTags = null,
  }) {
    return _then(_ScanResult(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedTags: null == suggestedTags
          ? _self._suggestedTags
          : suggestedTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$ScanResultWithImage {
  Uint8List get imageData;
  String get name;
  List<String> get suggestedTags;

  /// Create a copy of ScanResultWithImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScanResultWithImageCopyWith<ScanResultWithImage> get copyWith =>
      _$ScanResultWithImageCopyWithImpl<ScanResultWithImage>(
          this as ScanResultWithImage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScanResultWithImage &&
            const DeepCollectionEquality().equals(other.imageData, imageData) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other.suggestedTags, suggestedTags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imageData),
      name,
      const DeepCollectionEquality().hash(suggestedTags));

  @override
  String toString() {
    return 'ScanResultWithImage(imageData: $imageData, name: $name, suggestedTags: $suggestedTags)';
  }
}

/// @nodoc
abstract mixin class $ScanResultWithImageCopyWith<$Res> {
  factory $ScanResultWithImageCopyWith(
          ScanResultWithImage value, $Res Function(ScanResultWithImage) _then) =
      _$ScanResultWithImageCopyWithImpl;
  @useResult
  $Res call({Uint8List imageData, String name, List<String> suggestedTags});
}

/// @nodoc
class _$ScanResultWithImageCopyWithImpl<$Res>
    implements $ScanResultWithImageCopyWith<$Res> {
  _$ScanResultWithImageCopyWithImpl(this._self, this._then);

  final ScanResultWithImage _self;
  final $Res Function(ScanResultWithImage) _then;

  /// Create a copy of ScanResultWithImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageData = null,
    Object? name = null,
    Object? suggestedTags = null,
  }) {
    return _then(_self.copyWith(
      imageData: null == imageData
          ? _self.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedTags: null == suggestedTags
          ? _self.suggestedTags
          : suggestedTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _ScanResultWithImage implements ScanResultWithImage {
  const _ScanResultWithImage(
      {required this.imageData,
      this.name = "",
      final List<String> suggestedTags = const []})
      : _suggestedTags = suggestedTags;

  @override
  final Uint8List imageData;
  @override
  @JsonKey()
  final String name;
  final List<String> _suggestedTags;
  @override
  @JsonKey()
  List<String> get suggestedTags {
    if (_suggestedTags is EqualUnmodifiableListView) return _suggestedTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedTags);
  }

  /// Create a copy of ScanResultWithImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScanResultWithImageCopyWith<_ScanResultWithImage> get copyWith =>
      __$ScanResultWithImageCopyWithImpl<_ScanResultWithImage>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScanResultWithImage &&
            const DeepCollectionEquality().equals(other.imageData, imageData) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._suggestedTags, _suggestedTags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imageData),
      name,
      const DeepCollectionEquality().hash(_suggestedTags));

  @override
  String toString() {
    return 'ScanResultWithImage(imageData: $imageData, name: $name, suggestedTags: $suggestedTags)';
  }
}

/// @nodoc
abstract mixin class _$ScanResultWithImageCopyWith<$Res>
    implements $ScanResultWithImageCopyWith<$Res> {
  factory _$ScanResultWithImageCopyWith(_ScanResultWithImage value,
          $Res Function(_ScanResultWithImage) _then) =
      __$ScanResultWithImageCopyWithImpl;
  @override
  @useResult
  $Res call({Uint8List imageData, String name, List<String> suggestedTags});
}

/// @nodoc
class __$ScanResultWithImageCopyWithImpl<$Res>
    implements _$ScanResultWithImageCopyWith<$Res> {
  __$ScanResultWithImageCopyWithImpl(this._self, this._then);

  final _ScanResultWithImage _self;
  final $Res Function(_ScanResultWithImage) _then;

  /// Create a copy of ScanResultWithImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imageData = null,
    Object? name = null,
    Object? suggestedTags = null,
  }) {
    return _then(_ScanResultWithImage(
      imageData: null == imageData
          ? _self.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedTags: null == suggestedTags
          ? _self._suggestedTags
          : suggestedTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
