import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_17/data/database/data_base.dart';
import 'package:pp_17/data/models/quiz_entity.dart';

class QuizController extends ValueNotifier<QuizControllerState> {
  QuizController(super.value);

  final dataBase = GetIt.instance.get<DataBase>();

  void startQuiz() => value = value.copyWith(status: QuizzesStatus.progress);

  void resetStats() {
    value = value.copyWith(
      status: QuizzesStatus.idle,
      quizzes: [],
      activeQuiz: null,
      rightAnswers: 0,
    );
  }

  void endQuiz(int rigthAnswers) => value = value.copyWith(
        rightAnswers: rigthAnswers,
        status: QuizzesStatus.finish,
      );

  void finishQuizzes() {
    dataBase.passEntireQuizzes();
  }

  void next() {
    var quizIndex = value.quizzes.indexOf(value.activeQuiz!);
    if (quizIndex + 1 < value.quizzes.length) {
      value = value.copyWith(activeQuiz: value.quizzes[quizIndex + 1]);
    } else {
      value = value.copyWith(status: QuizzesStatus.finish);
    }
    notifyListeners();
  }
}

class QuizControllerState {
  final QuizzesStatus status;
  final List<Quiz> quizzes;
  final Quiz? activeQuiz;
  final int rightAnswers;

  QuizControllerState({
    this.status = QuizzesStatus.idle,
    required this.quizzes,
    this.activeQuiz,
    this.rightAnswers = 0,
  });

  QuizControllerState copyWith({
    QuizzesStatus? status,
    List<Quiz>? quizzes,
    Quiz? activeQuiz,
    int? rightAnswers,
  }) =>
      QuizControllerState(
        status: status ?? this.status,
        quizzes: quizzes ?? this.quizzes,
        activeQuiz: activeQuiz ?? this.activeQuiz,
        rightAnswers: rightAnswers ?? this.rightAnswers,
      );
}

enum QuizzesStatus {
  idle,
  progress,
  finish,
}
