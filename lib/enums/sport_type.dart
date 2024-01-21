import 'package:hive/hive.dart';

part 'sport_type.g.dart';

@HiveType(typeId: 5)
enum SportType {
  @HiveField(0) football,
  @HiveField(1) basketball,
  @HiveField(2) tennis,
  @HiveField(3) golf,
  @HiveField(4) baseball,
  @HiveField(5) hockey,
  @HiveField(6) volleyball,
  @HiveField(7) boxing,
  @HiveField(8) wrestling,
  @HiveField(9) swimming,
  @HiveField(10) athletics,
  @HiveField(11) gymnastics,
  @HiveField(12) figureSkating,
  @HiveField(13) snowboarding,
  @HiveField(14) skateboarding,
  @HiveField(15) climbing,
  @HiveField(16) cycling,
  @HiveField(17) badminton,
  @HiveField(18) rugby,
  @HiveField(19) powerlifting
}