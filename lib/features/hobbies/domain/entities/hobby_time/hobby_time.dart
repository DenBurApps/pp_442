import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_category/hobby_category.dart';

part 'hobby_time.g.dart';
part 'hobby_time.freezed.dart';

@freezed
@HiveType(typeId: 5)
class HobbyTime with _$HobbyTime {
  const factory HobbyTime({
    @HiveField(0) required String id,
    @HiveField(1) required HobbyCategory category,
    @HiveField(2) required DateTime date,
    @HiveField(3) required Duration duration,
  }) = _HobbyTime;
}
