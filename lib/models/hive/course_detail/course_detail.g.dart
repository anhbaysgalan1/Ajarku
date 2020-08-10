// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseDetailAdapter extends TypeAdapter<CourseDetail> {
  @override
  final int typeId = 0;

  @override
  CourseDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseDetail(
      id: fields[0] as int,
      courseName: fields[1] as String,
      description: fields[2] as String,
      rating: fields[3] as int,
      tutor: fields[4] as String,
      category: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CourseDetail obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.courseName)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.tutor)
      ..writeByte(5)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
