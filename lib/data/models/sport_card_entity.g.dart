// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport_card_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SportCardAdapter extends TypeAdapter<SportCard> {
  @override
  final int typeId = 0;

  @override
  SportCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SportCard(
      type: fields[0] as SportType,
      imagePath: fields[1] as String,
      name: fields[2] as String,
      lesson: fields[3] as Lesson,
      quizzes: (fields[4] as List).cast<Quiz>(),
      quizStatus: fields[5] as QuizStatus,
      quizProgress: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SportCard obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.imagePath)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.lesson)
      ..writeByte(4)
      ..write(obj.quizzes)
      ..writeByte(5)
      ..write(obj.quizStatus)
      ..writeByte(6)
      ..write(obj.quizProgress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SportCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
