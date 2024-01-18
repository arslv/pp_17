import 'package:hive/hive.dart';
import 'package:pp_17/data/models/step_entity.dart';

part 'lesson_entity.g.dart';

@HiveType(typeId: 1)
class Lesson extends HiveObject {
  @HiveField(0)
  late final String text;

  @HiveField(1)
  late final bool isPassed;

  Lesson({required this.text, required this.isPassed});

  final int maxWords = 317;

  List<LessonStep> splitTextIntoSteps(int wordsPerStep) {
    List<LessonStep> steps = [];

    List<String> sentences = text.split('. ');

    int currentIndex = 0;

    while (currentIndex < sentences.length) {
      String currentStepText = '';
      int wordsInCurrentStep = 0;

      while (currentIndex < sentences.length &&
          wordsInCurrentStep + sentences[currentIndex].split(' ').length <= wordsPerStep) {
        currentStepText += '${sentences[currentIndex]}. ';
        currentIndex++;
        wordsInCurrentStep += sentences[currentIndex - 1].split(' ').length;
      }

      if (currentStepText.isNotEmpty) {
        steps.add(LessonStep(currentStepText.trim()));
      }
    }

    return steps;
  }

  Lesson copyWith({String? text, bool? isPassed}) =>
      Lesson(text: text ?? this.text, isPassed: isPassed ?? this.isPassed);
}
