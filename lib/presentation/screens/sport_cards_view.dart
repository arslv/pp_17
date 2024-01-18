import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_17/controllers/services/navigation/route_names.dart';
import 'package:pp_17/data/database/data_base.dart';
import 'package:pp_17/data/models/sport_card_entity.dart';
import 'package:pp_17/presentation/widgets/app_button.dart';
import 'package:pp_17/presentation/widgets/sport_card.dart';

class SportCardsView extends StatefulWidget {
  const SportCardsView({super.key});

  @override
  State<SportCardsView> createState() => _SportCardsViewState();
}

class _SportCardsViewState extends State<SportCardsView> {
  var sportCards = <SportCard>[];
  final dataBase = GetIt.instance.get<DataBase>();

  void loadCards() {
    sportCards = dataBase.sportCards;
  }

  @override
  void initState() {
    loadCards();
    super.initState();
  }

  void _confirmLessonStart(SportCard sportCard) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 200,
            child: Column(
              children: [
                Text(
                  sportCard.name,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Text(sportCard.lesson.isPassed ? 'Lesson learned' : 'Not started', style: Theme.of(context).textTheme.labelSmall,),
                const Spacer(),
                AppButton(
                  name: 'Start lesson',
                  callback: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(RouteNames.lesson, arguments: sportCard);
                  },
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.secondary,
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height
          ),
          width: double.infinity,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 64),
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Cards',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: sportCards.length,
                itemBuilder: (BuildContext context, int index) {
                  return SportCardWidget(
                    sportCard: sportCards[index],
                    callback: () => _confirmLessonStart(sportCards[index]),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.9,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
