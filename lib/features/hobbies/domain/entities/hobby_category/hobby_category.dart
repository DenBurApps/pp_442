import 'package:hive/hive.dart';
import 'package:pp_442/gen/assets.gen.dart';

part 'hobby_category.g.dart';

@HiveType(typeId: 0)
enum HobbyCategory {
  @HiveField(0)
  music,
  @HiveField(1)
  photography,
  @HiveField(2)
  crafts,
  @HiveField(3)
  art,
  @HiveField(4)
  sports,
  @HiveField(5)
  gardening,
  @HiveField(6)
  writing,
  @HiveField(7)
  fashion,
  @HiveField(8)
  projects,
}

extension HobbyCategoryExtension on HobbyCategory {
  String get assetName => switch (this) {
        HobbyCategory.music => Assets.images.categories.music.path,
        HobbyCategory.photography => Assets.images.categories.photography.path,
        HobbyCategory.crafts => Assets.images.categories.crafts.path,
        HobbyCategory.art => Assets.images.categories.art.path,
        HobbyCategory.sports => Assets.images.categories.sports.path,
        HobbyCategory.gardening => Assets.images.categories.gardening.path,
        HobbyCategory.writing => Assets.images.categories.writing.path,
        HobbyCategory.fashion => Assets.images.categories.fashion.path,
        HobbyCategory.projects => Assets.images.categories.projects.path,
      };
}
