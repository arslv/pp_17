import 'package:hive/hive.dart';

part 'quiz_entity.g.dart';

@HiveType(typeId: 2)
class Quiz extends HiveObject {
  @HiveField(0)
  late final String name;
  @HiveField(1)
  late final String question;
  @HiveField(2)
  late final List<String> answers;
  @HiveField(3)
  late final String rightAnswer;
  @HiveField(4)
  late final bool isPassed;

  Quiz({
    required this.name,
    required this.question,
    required this.answers,
    required this.rightAnswer,
    required this.isPassed,
  });

  Quiz copyWith({
    String? name,
    String? question,
    List<String>? answers,
    String? rightAnswer,
    bool? isPassed,
  }) =>
      Quiz(
        name: name ?? this.name,
        question: question ?? this.question,
        answers: answers ?? this.answers,
        rightAnswer: rightAnswer ?? this.rightAnswer,
        isPassed: isPassed ?? this.isPassed,
      );
}
