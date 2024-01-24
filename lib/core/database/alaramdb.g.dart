// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alaramdb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlaramdbAdapter extends TypeAdapter<Alaramdb> {
  @override
  final int typeId = 1;

  @override
  Alaramdb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Alaramdb(
      time: fields[0] as String,
      label: fields[1] as String?,
      isActive: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Alaramdb obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.label)
      ..writeByte(2)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlaramdbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
