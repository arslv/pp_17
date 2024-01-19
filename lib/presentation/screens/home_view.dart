import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_17/controllers/controllers/lesson_controller.dart';
import 'package:pp_17/data/database/database_service.dart';
import 'package:pp_17/data/models/news_model.dart';
import 'package:pp_17/helpers/image/image_helper.dart';
import 'package:pp_17/presentation/themes/custom_colors.dart';
import 'package:pp_17/presentation/widgets/news_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final LessonController _lessonController;
  final dataBase = GetIt.instance.get<DatabaseService>();

  void init() {
    _lessonController = LessonController();
  }

  Map<String, String> get parsePassedQuizToTime {
    final countPassedQuiz = dataBase.quizzesPassed;
    String hours = (countPassedQuiz * 20 / 60).toStringAsFixed(0);
    String minutes = (countPassedQuiz * 20 % 60).toStringAsFixed(0);

    return {hours: minutes};
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          padding: const EdgeInsets.only(left: 20, right: 20, top: 64),
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Home',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              const SizedBox(height: 10),
              StatsView(
                lessonsPassed: _lessonController.lessonPassedCount,
                totalStats: parsePassedQuizToTime,
              ),
              const SizedBox(height: 20),
              const NewsCards(),
            ],
          ),
        ),
      ),
    );
  }
}

class StatsView extends StatelessWidget {
  const StatsView({super.key, required this.lessonsPassed, required this.totalStats});

  final int lessonsPassed;
  final Map<String, String> totalStats;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'YOUR STATS',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).extension<CustomColors>()!.grey!.withOpacity(0.5)),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              height: 164,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ImageHelper.getImage(ImageNames.totalBg).image, fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageHelper.svgImage(SvgNames.stats),
                  const SizedBox(height: 9),
                  Text(
                    'TOTAL',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  const SizedBox(height: 5),
                  Text.rich(TextSpan(
                      text: '${totalStats.keys.elementAt(0)}\'',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                      children: [
                        TextSpan(
                          text: ' hours',
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5)),
                        )
                      ])),
                  const SizedBox(height: 5),
                  Text.rich(TextSpan(
                      text: '${totalStats.values.elementAt(0)}\'',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                      children: [
                        TextSpan(
                          text: ' mins',
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5)),
                        )
                      ]))
                ],
              ),
            ),
            Container(
              width: 215,
              height: 164,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ImageHelper.getImage(ImageNames.lessonsBg).image, fit: BoxFit.cover)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 6, top: 6),
                    child: Text.rich(
                      TextSpan(
                          text: '$lessonsPassed/20\n',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                          children: [
                            TextSpan(
                              text: 'lessons',
                              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5)),
                            )
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class NewsCards extends StatefulWidget {
  const NewsCards({super.key});

  @override
  State<NewsCards> createState() => _NewsCardsState();
}

class _NewsCardsState extends State<NewsCards> {
  final dataBase = GetIt.instance.get<DatabaseService>();
  late final List<News> news;

  @override
  void initState() {
    setState(() {
      news = dataBase.news;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SPORT NEWS',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).extension<CustomColors>()!.grey!.withOpacity(0.5)),
        ),
        const SizedBox(height: 10),
        Column(
          children: [...news.map((e) => NewsWidget(news: e))],
        )
      ],
    );
  }
}
