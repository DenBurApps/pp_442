// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hobby.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HobbyAdapter extends TypeAdapter<Hobby> {
  @override
  final int typeId = 2;

  @override
  Hobby read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hobby(
      id: fields[0] as String,
      category: fields[1] as HobbyCategory,
      name: fields[2] as String,
      date: fields[3] as DateTime,
      time: fields[4] as DateTime,
      reps: (fields[5] as List?)?.cast<Weekday>(),
      stages: (fields[6] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Hobby obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.reps)
      ..writeByte(6)
      ..write(obj.stages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HobbyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
