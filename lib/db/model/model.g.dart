// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class transactionmodelAdapter extends TypeAdapter<transactionmodel> {
  @override
  final int typeId = 1;

  @override
  transactionmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return transactionmodel(
      discription: fields[0] as String,
      type: fields[1] as String,
      amount: fields[2] as String,
      date: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, transactionmodel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.discription)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is transactionmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
