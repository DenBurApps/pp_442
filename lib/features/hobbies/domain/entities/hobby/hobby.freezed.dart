// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hobby.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Hobby {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  HobbyCategory get category => throw _privateConstructorUsedError;
  @HiveField(2)
  String get name => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get time => throw _privateConstructorUsedError;
  @HiveField(5)
  List<Weekday>? get reps => throw _privateConstructorUsedError;
  @HiveField(6)
  List<String>? get stages => throw _privateConstructorUsedError;

  /// Create a copy of Hobby
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HobbyCopyWith<Hobby> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HobbyCopyWith<$Res> {
  factory $HobbyCopyWith(Hobby value, $Res Function(Hobby) then) =
      _$HobbyCopyWithImpl<$Res, Hobby>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) HobbyCategory category,
      @HiveField(2) String name,
      @HiveField(3) DateTime date,
      @HiveField(4) DateTime time,
      @HiveField(5) List<Weekday>? reps,
      @HiveField(6) List<String>? stages});
}

/// @nodoc
class _$HobbyCopyWithImpl<$Res, $Val extends Hobby>
    implements $HobbyCopyWith<$Res> {
  _$HobbyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Hobby
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? name = null,
    Object? date = null,
    Object? time = null,
    Object? reps = freezed,
    Object? stages = freezed,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reps: freezed == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as List<Weekday>?,
      stages: freezed == stages
          ? _value.stages
          : stages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HobbyImplCopyWith<$Res> implements $HobbyCopyWith<$Res> {
  factory _$$HobbyImplCopyWith(
          _$HobbyImpl value, $Res Function(_$HobbyImpl) then) =
      __$$HobbyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) HobbyCategory category,
      @HiveField(2) String name,
      @HiveField(3) DateTime date,
      @HiveField(4) DateTime time,
      @HiveField(5) List<Weekday>? reps,
      @HiveField(6) List<String>? stages});
}

/// @nodoc
class __$$HobbyImplCopyWithImpl<$Res>
    extends _$HobbyCopyWithImpl<$Res, _$HobbyImpl>
    implements _$$HobbyImplCopyWith<$Res> {
  __$$HobbyImplCopyWithImpl(
      _$HobbyImpl _value, $Res Function(_$HobbyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Hobby
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? name = null,
    Object? date = null,
    Object? time = null,
    Object? reps = freezed,
    Object? stages = freezed,
  }) {
    return _then(_$HobbyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as HobbyCategory,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reps: freezed == reps
          ? _value._reps
          : reps // ignore: cast_nullable_to_non_nullable
              as List<Weekday>?,
      stages: freezed == stages
          ? _value._stages
          : stages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$HobbyImpl implements _Hobby {
  const _$HobbyImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.category,
      @HiveField(2) required this.name,
      @HiveField(3) required this.date,
      @HiveField(4) required this.time,
      @HiveField(5) required final List<Weekday>? reps,
      @HiveField(6) required final List<String>? stages})
      : _reps = reps,
        _stages = stages;

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final HobbyCategory category;
  @override
  @HiveField(2)
  final String name;
  @override
  @HiveField(3)
  final DateTime date;
  @override
  @HiveField(4)
  final DateTime time;
  final List<Weekday>? _reps;
  @override
  @HiveField(5)
  List<Weekday>? get reps {
    final value = _reps;
    if (value == null) return null;
    if (_reps is EqualUnmodifiableListView) return _reps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _stages;
  @override
  @HiveField(6)
  List<String>? get stages {
    final value = _stages;
    if (value == null) return null;
    if (_stages is EqualUnmodifiableListView) return _stages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Hobby(id: $id, category: $category, name: $name, date: $date, time: $time, reps: $reps, stages: $stages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HobbyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality().equals(other._reps, _reps) &&
            const DeepCollectionEquality().equals(other._stages, _stages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      name,
      date,
      time,
      const DeepCollectionEquality().hash(_reps),
      const DeepCollectionEquality().hash(_stages));

  /// Create a copy of Hobby
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HobbyImplCopyWith<_$HobbyImpl> get copyWith =>
      __$$HobbyImplCopyWithImpl<_$HobbyImpl>(this, _$identity);
}

abstract class _Hobby implements Hobby {
  const factory _Hobby(
      {@HiveField(0) required final String id,
      @HiveField(1) required final HobbyCategory category,
      @HiveField(2) required final String name,
      @HiveField(3) required final DateTime date,
      @HiveField(4) required final DateTime time,
      @HiveField(5) required final List<Weekday>? reps,
      @HiveField(6) required final List<String>? stages}) = _$HobbyImpl;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  HobbyCategory get category;
  @override
  @HiveField(2)
  String get name;
  @override
  @HiveField(3)
  DateTime get date;
  @override
  @HiveField(4)
  DateTime get time;
  @override
  @HiveField(5)
  List<Weekday>? get reps;
  @override
  @HiveField(6)
  List<String>? get stages;

  /// Create a copy of Hobby
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HobbyImplCopyWith<_$HobbyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
