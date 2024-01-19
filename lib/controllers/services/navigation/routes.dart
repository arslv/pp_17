import 'package:flutter/cupertino.dart';
import 'package:pp_17/controllers/services/navigation/route_names.dart';
import 'package:pp_17/data/models/news_model.dart';
import 'package:pp_17/data/models/quiz_entity.dart';
import 'package:pp_17/data/models/sport_card_entity.dart';
import 'package:pp_17/presentation/screens/home_view.dart';
import 'package:pp_17/presentation/screens/lesson_view.dart';
import 'package:pp_17/presentation/screens/main_screen_view.dart';
import 'package:pp_17/presentation/screens/news_view.dart';
import 'package:pp_17/presentation/screens/onboarding.dart';
import 'package:pp_17/presentation/screens/privacy_view.dart';
import 'package:pp_17/presentation/screens/quizes_view.dart';
import 'package:pp_17/presentation/screens/splash_view.dart';
import 'package:pp_17/presentation/screens/sport_cards_view.dart';
import 'package:pp_17/presentation/screens/support_view.dart';

typedef ScreenBuilding = Widget Function(BuildContext context);

class Routes {
  static Map<String, ScreenBuilding> get(BuildContext context) {
    return {
      RouteNames.mainScreen: (context) => MainScreen(),
      RouteNames.splash: (context) => const SplashView(),
      RouteNames.home: (context) => const HomeView(),
      RouteNames.onboarding: (context) => const OnboardingView(),
      RouteNames.cards: (context) => const SportCardsView(),
      RouteNames.lesson: (context) {
        final sportCard =
            ModalRoute.of(context)!.settings.arguments as SportCard;

        return LessonView(sportCard: sportCard);
      },
      RouteNames.quizzes: (context) {
        final quizzes =
            ModalRoute.of(context)!.settings.arguments as List<Quiz>;

        return QuizzesView(quizzes: quizzes);
      },
      RouteNames.news: (context) {
        final news = ModalRoute.of(context)!.settings.arguments as News;

        return NewsView(news: news);
      },
      RouteNames.support: (context) => const SupportView(),
      RouteNames.privacy: (context) => const PrivacyView(),
    };
  }
}
