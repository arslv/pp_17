import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_17/data/database/data_base.dart';
import 'package:pp_17/data/models/quiz_entity.dart';

class QuizController extends ValueNotifier<QuizControllerState> {
  QuizController() : super(QuizControllerState.initial()) {
    initialize();
  }

  final dataBase = GetIt.instance.get<DataBase>();

  void initialize() {
    QuizControllerState.initial();
  }

  void resetStats() {
    value = value.copyWith(
      status: QuizzesStatus.idle,
      quizzes: [],
      activeQuiz: null,
      rightAnswers: 0,
    );
  }

  void start(List<Quiz> quizzes) {
    value = value.copyWith(
      status: QuizzesStatus.progress,
      quizzes: quizzes,
      activeQuiz: quizzes[0],
      rightAnswers: 0,
    );
    notifyListeners();
  }

  void incAnswers() {
    int ans = value.rightAnswers + 1;
    print(ans);
    value = value.copyWith(rightAnswers: ans);
    notifyListeners();
  }

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
    required this.status,
    required this.quizzes,
    required this.activeQuiz,
    required this.rightAnswers,
  });

  factory QuizControllerState.initial() {
    return QuizControllerState(
      status: QuizzesStatus.idle,
      quizzes: [],
      activeQuiz: null,
      rightAnswers: 0,
    );
  }

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
