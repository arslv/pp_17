import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_17/data/database/database_service.dart';
import 'package:pp_17/data/models/sport_card_entity.dart';

class LessonController extends ValueNotifier<LessonControllerState> {
  LessonController() : super(LessonControllerState.initial()) {
    initialize();
  }

  int get lessonPassedCount => value.lessonsPassed;

  final dataBase = GetIt.instance.get<DatabaseService>();

  void passLesson(SportCard card) {
    dataBase.passLesson(card.lesson);
    notifyListeners();
    initPassedLessons();
  }

  void initPassedLessons() {
    int passedLessonsCount = dataBase.lessonsPassed;
    value = value.copyWith(lessonsPassed: passedLessonsCount);
    notifyListeners();
  }

  void initialize() {
    LessonControllerState.initial();
    initPassedLessons();
  }
}

class LessonControllerState {
  final int lessonsPassed;

  LessonControllerState({
    required this.lessonsPassed,
  });

  factory LessonControllerState.initial() {
    return LessonControllerState(
      lessonsPassed: 0,
    );
  }

  LessonControllerState copyWith({
    int? lessonsPassed,
  }) =>
      LessonControllerState(
        lessonsPassed: lessonsPassed ?? this.lessonsPassed,
      );
}
