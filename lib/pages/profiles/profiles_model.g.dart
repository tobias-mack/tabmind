// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profiles_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileModelAdapter extends TypeAdapter<_$_ProfilesModel> {
  @override
  final int typeId = 0;

  @override
  _$_ProfilesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ProfilesModel(
      profileName: fields[0] as String,
      active: fields[1] as bool,
      reminders: (fields[2] as List).cast<ReminderPageModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_ProfilesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.profileName)
      ..writeByte(1)
      ..write(obj.active)
      ..writeByte(2)
      ..write(obj.reminders);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
