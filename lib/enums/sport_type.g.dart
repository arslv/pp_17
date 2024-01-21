// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SportTypeAdapter extends TypeAdapter<SportType> {
  @override
  final int typeId = 5;

  @override
  SportType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SportType.football;
      case 1:
        return SportType.basketball;
      case 2:
        return SportType.tennis;
      case 3:
        return SportType.golf;
      case 4:
        return SportType.baseball;
      case 5:
        return SportType.hockey;
      case 6:
        return SportType.volleyball;
      case 7:
        return SportType.boxing;
      case 8:
        return SportType.wrestling;
      case 9:
        return SportType.swimming;
      case 10:
        return SportType.athletics;
      case 11:
        return SportType.gymnastics;
      case 12:
        return SportType.figureSkating;
      case 13:
        return SportType.snowboarding;
      case 14:
        return SportType.skateboarding;
      case 15:
        return SportType.climbing;
      case 16:
        return SportType.cycling;
      case 17:
        return SportType.badminton;
      case 18:
        return SportType.rugby;
      case 19:
        return SportType.powerlifting;
      default:
        return SportType.football;
    }
  }

  @override
  void write(BinaryWriter writer, SportType obj) {
    switch (obj) {
      case SportType.football:
        writer.writeByte(0);
        break;
      case SportType.basketball:
        writer.writeByte(1);
        break;
      case SportType.tennis:
        writer.writeByte(2);
        break;
      case SportType.golf:
        writer.writeByte(3);
        break;
      case SportType.baseball:
        writer.writeByte(4);
        break;
      case SportType.hockey:
        writer.writeByte(5);
        break;
      case SportType.volleyball:
        writer.writeByte(6);
        break;
      case SportType.boxing:
        writer.writeByte(7);
        break;
      case SportType.wrestling:
        writer.writeByte(8);
        break;
      case SportType.swimming:
        writer.writeByte(9);
        break;
      case SportType.athletics:
        writer.writeByte(10);
        break;
      case SportType.gymnastics:
        writer.writeByte(11);
        break;
      case SportType.figureSkating:
        writer.writeByte(12);
        break;
      case SportType.snowboarding:
        writer.writeByte(13);
        break;
      case SportType.skateboarding:
        writer.writeByte(14);
        break;
      case SportType.climbing:
        writer.writeByte(15);
        break;
      case SportType.cycling:
        writer.writeByte(16);
        break;
      case SportType.badminton:
        writer.writeByte(17);
        break;
      case SportType.rugby:
        writer.writeByte(18);
        break;
      case SportType.powerlifting:
        writer.writeByte(19);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SportTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
