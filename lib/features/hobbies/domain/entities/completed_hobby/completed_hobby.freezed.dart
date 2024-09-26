// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'completed_hobby.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CompletedHobby {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get hobbyId => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get date => throw _privateConstructorUsedError;

  /// Create a copy of CompletedHobby
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompletedHobbyCopyWith<CompletedHobby> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompletedHobbyCopyWith<$Res> {
  factory $CompletedHobbyCopyWith(
          CompletedHobby value, $Res Function(CompletedHobby) then) =
      _$CompletedHobbyCopyWithImpl<$Res, CompletedHobby>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String hobbyId,
      @HiveField(2) DateTime date});
}

/// @nodoc
class _$CompletedHobbyCopyWithImpl<$Res, $Val extends CompletedHobby>
    implements $CompletedHobbyCopyWith<$Res> {
  _$CompletedHobbyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompletedHobby
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hobbyId = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hobbyId: null == hobbyId
          ? _value.hobbyId
          : hobbyId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompletedHobbyImplCopyWith<$Res>
    implements $CompletedHobbyCopyWith<$Res> {
  factory _$$CompletedHobbyImplCopyWith(_$CompletedHobbyImpl value,
          $Res Function(_$CompletedHobbyImpl) then) =
      __$$CompletedHobbyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String hobbyId,
      @HiveField(2) DateTime date});
}

/// @nodoc
class __$$CompletedHobbyImplCopyWithImpl<$Res>
    extends _$CompletedHobbyCopyWithImpl<$Res, _$CompletedHobbyImpl>
    implements _$$CompletedHobbyImplCopyWith<$Res> {
  __$$CompletedHobbyImplCopyWithImpl(
      _$CompletedHobbyImpl _value, $Res Function(_$CompletedHobbyImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompletedHobby
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hobbyId = null,
    Object? date = null,
  }) {
    return _then(_$CompletedHobbyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hobbyId: null == hobbyId
          ? _value.hobbyId
          : hobbyId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$CompletedHobbyImpl implements _CompletedHobby {
  const _$CompletedHobbyImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.hobbyId,
      @HiveField(2) required this.date});

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String hobbyId;
  @override
  @HiveField(2)
  final DateTime date;

  @override
  String toString() {
    return 'CompletedHobby(id: $id, hobbyId: $hobbyId, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompletedHobbyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hobbyId, hobbyId) || other.hobbyId == hobbyId) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, hobbyId, date);

  /// Create a copy of CompletedHobby
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompletedHobbyImplCopyWith<_$CompletedHobbyImpl> get copyWith =>
      __$$CompletedHobbyImplCopyWithImpl<_$CompletedHobbyImpl>(
          this, _$identity);
}

abstract class _CompletedHobby implements CompletedHobby {
  const factory _CompletedHobby(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String hobbyId,
      @HiveField(2) required final DateTime date}) = _$CompletedHobbyImpl;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get hobbyId;
  @override
  @HiveField(2)
  DateTime get date;

  /// Create a copy of CompletedHobby
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompletedHobbyImplCopyWith<_$CompletedHobbyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
