import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_17/data/database/data_base.dart';
import 'package:pp_17/data/models/news_model.dart';
import 'package:pp_17/helpers/image/image_helper.dart';
import 'package:pp_17/presentation/themes/custom_colors.dart';
import 'package:pp_17/presentation/widgets/news_card.dart';
import 'package:pp_17/presentation/widgets/sport_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height
          ),
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
              const StatsView(),
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
  const StatsView({super.key});

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
                      text: '100\'',
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
                      text: '50\'',
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 6, top: 6),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text.rich(
                        TextSpan(
                            text: '10/50\n',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                            children: [
                              TextSpan(
                                text: 'lessons',
                                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary.withOpacity(0.5)),
                              )
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 12),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: [
                            Text(
                              'FOOTBALL',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                            ),
                            const SizedBox(width: 5),
                            ImageHelper.svgImage(SvgNames.soccer, width: 15, height: 15)
                          ],
                        )),
                  )
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
  final dataBase = GetIt.instance.get<DataBase>();
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
          children: [
            ...news.map((e) => NewsWidget(news: e))
          ],
        )
      ],
    );
  }
}


