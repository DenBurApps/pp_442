import 'package:hive_flutter/hive_flutter.dart';
import 'package:pp_442/core/services/duration_adapter.dart';
import 'package:pp_442/features/hobbies/domain/entities/completed_hobby/completed_hobby.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby/hobby.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_category/hobby_category.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_time/hobby_time.dart';
import 'package:pp_442/features/hobbies/domain/entities/weekday/weekday.dart';

class DatabaseService {
  late Box<Hobby> hobbies;
  late Box<CompletedHobby> completedHobbies;
  late Box<HobbyTime> hobbyTimes;

  Future<DatabaseService> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HobbyCategoryAdapter());
    Hive.registerAdapter(WeekdayAdapter());
    Hive.registerAdapter(HobbyAdapter());
    Hive.registerAdapter(CompletedHobbyAdapter());
    Hive.registerAdapter(DurationAdapter());
    Hive.registerAdapter(HobbyTimeAdapter());

    hobbies = await Hive.openBox('hobbies');
    completedHobbies = await Hive.openBox('completedHobbies');
    hobbyTimes = await Hive.openBox('hobbyTimes');
    return this;
  }
}
