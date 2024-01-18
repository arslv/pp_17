// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_statuses.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizStatusAdapter extends TypeAdapter<QuizStatus> {
  @override
  final int typeId = 6;

  @override
  QuizStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return QuizStatus.notStarted;
      case 1:
        return QuizStatus.completed;
      case 2:
        return QuizStatus.fail;
      default:
        return QuizStatus.notStarted;
    }
  }

  @override
  void write(BinaryWriter writer, QuizStatus obj) {
    switch (obj) {
      case QuizStatus.notStarted:
        writer.writeByte(0);
        break;
      case QuizStatus.completed:
        writer.writeByte(1);
        break;
      case QuizStatus.fail:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
