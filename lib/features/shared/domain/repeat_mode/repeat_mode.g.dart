// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeat_mode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepeatModeAdapter extends TypeAdapter<RepeatMode> {
  @override
  final int typeId = 1;

  @override
  RepeatMode read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RepeatMode.everyDay;
      case 1:
        return RepeatMode.everyOtherDay;
      case 2:
        return RepeatMode.weekdays;
      case 3:
        return RepeatMode.weekends;
      default:
        return RepeatMode.everyDay;
    }
  }

  @override
  void write(BinaryWriter writer, RepeatMode obj) {
    switch (obj) {
      case RepeatMode.everyDay:
        writer.writeByte(0);
        break;
      case RepeatMode.everyOtherDay:
        writer.writeByte(1);
        break;
      case RepeatMode.weekdays:
        writer.writeByte(2);
        break;
      case RepeatMode.weekends:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepeatModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
