import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_17/data/database/data_base.dart';
import 'package:pp_17/data/models/quiz_entity.dart';
import 'package:pp_17/data/models/sport_card_entity.dart';

class LessonController extends ValueNotifier<LessonControllerState> {
  LessonController() : super(LessonControllerState.initial()) {
    initialize();
  }

  int get lessonPassedCount => value.lessonPassed;

  final dataBase = GetIt.instance.get<DataBase>();

  void passLesson(SportCard card) {
    dataBase.passLesson(card.lesson);
    notifyListeners();
  }

  void initialize() {
    LessonControllerState.initial();
  }
}

class LessonControllerState {
  final int lessonPassed;

  LessonControllerState({
    required this.lessonPassed,
  });

  factory LessonControllerState.initial() {
    return LessonControllerState(
      lessonPassed: 0,
    );
  }

  LessonControllerState copyWith({
    int? lessonPassed,
  }) =>
      LessonControllerState(
        lessonPassed: lessonPassed ?? this.lessonPassed,
      );
}
