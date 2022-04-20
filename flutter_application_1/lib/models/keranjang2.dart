// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keranjang.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KeranjangAdapter extends TypeAdapter<Keranjang> {
  @override
  final int typeId = 0;

  @override
  Keranjang read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Keranjang(
      title: fields[1] as String,
      description: fields[2] as String,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, Keranjang obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KeranjangAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
