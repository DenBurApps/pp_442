import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_category/hobby_category.dart';
import 'package:pp_442/features/hobbies/domain/entities/weekday/weekday.dart';

part 'hobby.g.dart';
part 'hobby.freezed.dart';

@freezed
@HiveType(typeId: 2)
class Hobby with _$Hobby {
  const factory Hobby({
    @HiveField(0) required String id,
    @HiveField(1) required HobbyCategory category,
    @HiveField(2) required String name,
    @HiveField(3) required DateTime date,
    @HiveField(4) required DateTime time,
    @HiveField(5) required List<Weekday>? reps,
    @HiveField(6) required List<String>? stages,
  }) = _Hobby;
}
