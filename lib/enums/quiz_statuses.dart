import 'package:hive/hive.dart';

part 'quiz_statuses.g.dart';

@HiveType(typeId: 6)
enum QuizStatus {
  @HiveField(0) notStarted('Not stared'),
  @HiveField(1) completed('Successful Completed'),
  @HiveField(2) fail("You didn't pass the test");

  final String name;

  const QuizStatus(this.name);
}