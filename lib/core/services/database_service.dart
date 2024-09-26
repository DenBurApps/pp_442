import 'package:hive_flutter/hive_flutter.dart';
import 'package:pp_442/features/hobbies/domain/entities/completed_hobby/completed_hobby.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby/hobby.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_category/hobby_category.dart';
import 'package:pp_442/features/hobbies/domain/entities/weekday/weekday.dart';

class DatabaseService {
  late Box<Hobby> hobbies;
  late Box<CompletedHobby> completedHobbies;

  Future<DatabaseService> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HobbyCategoryAdapter());
    Hive.registerAdapter(WeekdayAdapter());
    Hive.registerAdapter(HobbyAdapter());
    Hive.registerAdapter(CompletedHobbyAdapter());

    hobbies = await Hive.openBox('hobbies');
    completedHobbies = await Hive.openBox('completedHobbies');
    return this;
  }
}
