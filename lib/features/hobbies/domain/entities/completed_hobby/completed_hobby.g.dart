// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_hobby.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompletedHobbyAdapter extends TypeAdapter<CompletedHobby> {
  @override
  final int typeId = 3;

  @override
  CompletedHobby read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompletedHobby(
      id: fields[0] as String,
      hobbyId: fields[1] as String,
      date: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CompletedHobby obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.hobbyId)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompletedHobbyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
