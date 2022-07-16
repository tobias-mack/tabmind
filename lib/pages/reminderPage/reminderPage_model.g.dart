// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminderPage_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReminderPageModelAdapter extends TypeAdapter<_$_ReminderPageModel> {
  @override
  final int typeId = 1;

  @override
  _$_ReminderPageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ReminderPageModel(
      name: fields[0] as String,
      dosis: fields[1] as String,
      frequency: fields[2] as String,
      importance: fields[3] as String,
      details: fields[4] as String,
      timeOfDay: fields[5] as TimeOfDay,
      status: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ReminderPageModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.dosis)
      ..writeByte(2)
      ..write(obj.frequency)
      ..writeByte(3)
      ..write(obj.importance)
      ..writeByte(4)
      ..write(obj.details)
      ..writeByte(5)
      ..write(obj.timeOfDay)
      ..writeByte(6)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderPageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
