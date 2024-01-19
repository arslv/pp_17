import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pp_17/data/models/lesson_entity.dart';
import 'package:pp_17/data/models/news_model.dart';
import 'package:pp_17/data/models/quiz_entity.dart';
import 'package:pp_17/data/models/sport_card_entity.dart';
import 'package:pp_17/enums/quiz_statuses.dart';
import 'package:pp_17/enums/sport_type.dart';
import 'package:pp_17/helpers/image/news_text.dart';
import 'package:pp_17/helpers/lessons_text.dart';

class DataBase {
  late final Box _common;
  late final Box<SportCard> _sportCards;
  late final Box<News> _news;

  init() async {
    await Hive.initFlutter();
    final appDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDirectory.path);

    Hive.registerAdapter(SportCardAdapter());
    Hive.registerAdapter(LessonAdapter());
    Hive.registerAdapter(QuizAdapter());
    Hive.registerAdapter(SportTypeAdapter());
    Hive.registerAdapter(QuizStatusAdapter());
    Hive.registerAdapter(NewsAdapter());

    _common = await Hive.openBox('_common');
    _sportCards = await Hive.openBox('_sportCards');
    _news = await Hive.openBox('_news');

    setupSportCards();
    setupNews();
  }

  void setupNews() {
    if (_news.isEmpty) {
      _news.addAll([
        News(
          title: 'Экс-защитник «Баварии» Боатенг может перейти в «Салернитану»',
          text: NewsText.firstNews,
          imagePath: 'assets/images/news1.jpg',
          iconPath: 'assets/images/ball.png',
        ),
      ]);
    }
  }

  void setupSportCards() {
    if (sportCards.isEmpty) {
      _sportCards.addAll([
        SportCard(
          type: SportType.football,
          imagePath: '',
          name: 'Football history, great beginning',
          lesson: Lesson(
            text: LessonsText.football,
            isPassed: false,
          ),
          quizStatus: QuizStatus.notStarted,
          quizProgress: 0,
          quizzes: [
            Quiz(
              name: 'Football history, great beginning',
              question: 'Какое количество игроков составляет команду в футболе?',
              answers: ['7', '9', '11', '13'],
              rightAnswer: '11',
              isPassed: false,
            ),
            Quiz(
              name: 'Football history, great beginning',
              question:
                  'Какая страна является рекордсменом по количеству побед на чемпионатах мира по футболу?',
              answers: ['Бразилия', 'Германия', 'Италия', 'Аргентина'],
              rightAnswer: 'Бразилия',
              isPassed: false,
            ),
            Quiz(
              name: 'Football history, great beginning',
              question: 'Какой игрок считается лучшим футболистом всех времен?',
              answers: ['Лионель Месси', 'Криштиану Роналду', 'Пеле', 'Диего Марадона'],
              rightAnswer: 'Пеле',
              isPassed: false,
            ),
            Quiz(
              name: 'Football history, great beginning',
              question:
                  'Какое количество полей нужно для проведения официального матча по футболу?',
              answers: ['1', '2', '3', '4'],
              rightAnswer: '1',
              isPassed: false,
            ),
            Quiz(
              name: 'Football history, great beginning',
              question:
                  'Какой футбольный клуб является рекордсменом по количеству побед в Лиге чемпионов УЕФА?',
              answers: ['Реал Мадрид', 'Барселона', 'Манчестер Юнайтед', 'Бавария Мюнхен'],
              rightAnswer: 'Реал Мадрид',
              isPassed: false,
            ),
          ],
        ),
      ]);
    }
  }

  void passLesson(Lesson lesson) {
    SportCard card = _sportCards.values.firstWhere((sportCard) => sportCard.lesson == lesson);
    int indexOfCard = _sportCards.values.toList().indexOf(card);
    Lesson passedCardLesson = card.lesson.copyWith(isPassed: true);

    card = card.copyWith(lesson: passedCardLesson);

    putCard(indexOfCard, card);
  }

  void completeQuizzesTest(List<Quiz> quizzes, int quizProgress) {
    SportCard card = _sportCards.values.firstWhere((sportCard) => sportCard.quizzes == quizzes);
    int indexOfCard = _sportCards.values.toList().indexOf(card);

    if (quizProgress == 100) {
      card = card.copyWith(quizStatus: QuizStatus.completed, quizProgress: 100);
    } else {
      card = card.copyWith(quizStatus: QuizStatus.fail, quizProgress: quizProgress);
    }


    putCard(indexOfCard, card);
  }

  void passTest(Quiz quiz) {
    final SportCard card =
        _sportCards.values.firstWhere((sportCard) => sportCard.quizzes.contains(quiz));
    if (!quiz.isPassed) {
      card.quizzes.remove(quiz);
      quiz = quiz.copyWith(isPassed: true);
      card.quizzes.add(quiz);
    }
    card.save();
  }

  void passEntireQuiz() {

  }

  List<SportCard> get sportCards => _sportCards.values.toList();

  List<News> get news => _news.values.toList();

  int get lessonsPassed {
    var count = 0;
    for (var element in sportCards) {
      if (element.lesson.isPassed) {
        count++;
      }
    }
    return count;
  }

  int get quizzesPassed {
    var count = 0;
    for (var element in sportCards) {
      if (element.quizStatus == QuizStatus.completed) {
        count++;
      }
    }
    return count;
  }

  void put(String key, dynamic value) => _common.put(key, value);

  dynamic get(String key) => _common.get(key);

  void putCard(int index, SportCard card) => _sportCards.put(index, card);
}
