import 'package:hive/hive.dart';

part 'repeat_mode.g.dart';

@HiveType(typeId: 1)
enum RepeatMode {
  @HiveField(0)
  everyDay('Every day'),
  @HiveField(1)
  everyOtherDay('Every other day'),
  @HiveField(2)
  weekdays('On weekdays'),
  @HiveField(3)
  weekends('On weekends');

  final String title;

  const RepeatMode(this.title);
}
