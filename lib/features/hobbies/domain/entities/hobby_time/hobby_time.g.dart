// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hobby_time.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HobbyTimeAdapter extends TypeAdapter<HobbyTime> {
  @override
  final int typeId = 5;

  @override
  HobbyTime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HobbyTime(
      id: fields[0] as String,
      category: fields[1] as HobbyCategory,
      date: fields[2] as DateTime,
      duration: fields[3] as Duration,
    );
  }

  @override
  void write(BinaryWriter writer, HobbyTime obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HobbyTimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
