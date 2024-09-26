// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hobby_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HobbyCategoryAdapter extends TypeAdapter<HobbyCategory> {
  @override
  final int typeId = 0;

  @override
  HobbyCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return HobbyCategory.music;
      case 1:
        return HobbyCategory.photography;
      case 2:
        return HobbyCategory.crafts;
      case 3:
        return HobbyCategory.art;
      case 4:
        return HobbyCategory.sports;
      case 5:
        return HobbyCategory.gardening;
      case 6:
        return HobbyCategory.writing;
      case 7:
        return HobbyCategory.fashion;
      case 8:
        return HobbyCategory.projects;
      default:
        return HobbyCategory.music;
    }
  }

  @override
  void write(BinaryWriter writer, HobbyCategory obj) {
    switch (obj) {
      case HobbyCategory.music:
        writer.writeByte(0);
        break;
      case HobbyCategory.photography:
        writer.writeByte(1);
        break;
      case HobbyCategory.crafts:
        writer.writeByte(2);
        break;
      case HobbyCategory.art:
        writer.writeByte(3);
        break;
      case HobbyCategory.sports:
        writer.writeByte(4);
        break;
      case HobbyCategory.gardening:
        writer.writeByte(5);
        break;
      case HobbyCategory.writing:
        writer.writeByte(6);
        break;
      case HobbyCategory.fashion:
        writer.writeByte(7);
        break;
      case HobbyCategory.projects:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HobbyCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
