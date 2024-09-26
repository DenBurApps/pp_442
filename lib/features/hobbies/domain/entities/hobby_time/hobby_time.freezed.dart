// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hobby_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HobbyTime {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  HobbyCategory get category => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(3)
  Duration get duration => throw _privateConstructorUsedError;

  /// Create a copy of HobbyTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HobbyTimeCopyWith<HobbyTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HobbyTimeCopyWith<$Res> {
  factory $HobbyTimeCopyWith(HobbyTime value, $Res Function(HobbyTime) then) =
      _$HobbyTimeCopyWithImpl<$Res, HobbyTime>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) HobbyCategory category,
      @HiveField(2) DateTime date,
      @HiveField(3) Duration duration});
}

/// @nodoc
class _$HobbyTimeCopyWithImpl<$Res, $Val extends HobbyTime>
    implements $HobbyTimeCopyWith<$Res> {
  _$HobbyTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HobbyTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? date = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as HobbyCategory,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HobbyTimeImplCopyWith<$Res>
    implements $HobbyTimeCopyWith<$Res> {
  factory _$$HobbyTimeImplCopyWith(
          _$HobbyTimeImpl value, $Res Function(_$HobbyTimeImpl) then) =
      __$$HobbyTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) HobbyCategory category,
      @HiveField(2) DateTime date,
      @HiveField(3) Duration duration});
}

/// @nodoc
class __$$HobbyTimeImplCopyWithImpl<$Res>
    extends _$HobbyTimeCopyWithImpl<$Res, _$HobbyTimeImpl>
    implements _$$HobbyTimeImplCopyWith<$Res> {
  __$$HobbyTimeImplCopyWithImpl(
      _$HobbyTimeImpl _value, $Res Function(_$HobbyTimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of HobbyTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? date = null,
    Object? duration = null,
  }) {
    return _then(_$HobbyTimeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as HobbyCategory,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$HobbyTimeImpl implements _HobbyTime {
  const _$HobbyTimeImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.category,
      @HiveField(2) required this.date,
      @HiveField(3) required this.duration});

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final HobbyCategory category;
  @override
  @HiveField(2)
  final DateTime date;
  @override
  @HiveField(3)
  final Duration duration;

  @override
  String toString() {
    return 'HobbyTime(id: $id, category: $category, date: $date, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HobbyTimeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, category, date, duration);

  /// Create a copy of HobbyTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HobbyTimeImplCopyWith<_$HobbyTimeImpl> get copyWith =>
      __$$HobbyTimeImplCopyWithImpl<_$HobbyTimeImpl>(this, _$identity);
}

abstract class _HobbyTime implements HobbyTime {
  const factory _HobbyTime(
      {@HiveField(0) required final String id,
      @HiveField(1) required final HobbyCategory category,
      @HiveField(2) required final DateTime date,
      @HiveField(3) required final Duration duration}) = _$HobbyTimeImpl;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  HobbyCategory get category;
  @override
  @HiveField(2)
  DateTime get date;
  @override
  @HiveField(3)
  Duration get duration;

  /// Create a copy of HobbyTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HobbyTimeImplCopyWith<_$HobbyTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
