// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskly_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasklyResponseModelAdapter extends TypeAdapter<TasklyResponseModel> {
  @override
  final int typeId = 0;

  @override
  TasklyResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TasklyResponseModel(
      content: fields[0] as String,
      dateTime: fields[1] as String,
      status: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TasklyResponseModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.dateTime)
      ..writeByte(2)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasklyResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
