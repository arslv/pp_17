import 'package:hive/hive.dart';
import 'package:pp_17/data/models/lesson_entity.dart';
import 'package:pp_17/data/models/quiz_entity.dart';
import 'package:pp_17/enums/quiz_statuses.dart';
import 'package:pp_17/enums/sport_type.dart';

part 'sport_card_entity.g.dart';

@HiveType(typeId: 0)
class SportCard extends HiveObject {
  @HiveField(0)
  late final SportType type;
  @HiveField(1)
  late final String imagePath;
  @HiveField(2)
  late final String name;
  @HiveField(3)
  late final Lesson lesson;
  @HiveField(4)
  late final List<Quiz> quizzes;
  @HiveField(5)
  late final QuizStatus quizStatus;
  @HiveField(6)
  late final int quizProgress;

  SportCard({
    required this.type,
    required this.imagePath,
    required this.name,
    required this.lesson,
    required this.quizzes,
    required this.quizStatus,
    required this.quizProgress,
  });

  SportCard copyWith({
    SportType? type,
    String? imagePath,
    String? name,
    Lesson? lesson,
    List<Quiz>? quizzes,
    QuizStatus? quizStatus,
    int? quizProgress,
  }) =>
      SportCard(
        type: type ?? this.type,
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        lesson: lesson ?? this.lesson,
        quizzes: quizzes ?? this.quizzes,
        quizStatus: quizStatus ?? this.quizStatus,
        quizProgress: quizProgress ?? this.quizProgress,
      );
}
