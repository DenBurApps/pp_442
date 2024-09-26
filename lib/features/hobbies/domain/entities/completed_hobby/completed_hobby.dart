import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'completed_hobby.g.dart';
part 'completed_hobby.freezed.dart';

@freezed
@HiveType(typeId: 3)
class CompletedHobby with _$CompletedHobby {
  const factory CompletedHobby({
    @HiveField(0) required String id,
    @HiveField(1) required String hobbyId,
    @HiveField(2) required DateTime date,
  }) = _CompletedHobby;
}
