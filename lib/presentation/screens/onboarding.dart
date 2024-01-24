import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_17/controllers/services/navigation/route_names.dart';
import 'package:pp_17/data/database/database_keys.dart';
import 'package:pp_17/data/database/database_service.dart';
import 'package:pp_17/helpers/image/image_helper.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _databaseService = GetIt.instance<DatabaseService>();

  int currentStep = 0;

  final images = [
    ImageHelper.getImage(ImageNames.onb1),
    ImageHelper.getImage(ImageNames.onb2),
    ImageHelper.getImage(ImageNames.onb3),
    ImageHelper.getImage(ImageNames.onb4),
  ];

  final Map<int, Map<String, String>> _stepsInfo = {
    0: {
      'title': 'LETS GET STARTED',
      'subtitle':
          'Lorem ipsum dolor sit amet consectetur. ut risus ut iaculis neque vitae arcu.'
    },
    1: {
      'title': 'WATCH YOUR STATS!',
      'subtitle': 'Keep track of lessons learned, content learned!'
    },
    2: {
      'title': 'FEATURES.RULES.HISTORY',
      'subtitle': 'Read useful articles on your favorite sport.'
    },
    3: {
      'title': 'LEARN ALL ABOUT YOUR FAVORITE SPORT!',
      'subtitle':
          'Join us and become a true champion in the realm of sports quizzes!'
    },
  };

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    _databaseService.put(DatabaseKeys.seenOnboarding, true);
  }

  Map<String, String> getStepInfo(int step) {
    return _stepsInfo[step] ??
        {'title': 'Default Title', 'subtitle': 'Default Subtitle'};
  }

  void increaseStep() {
    if (currentStep == 3) {
      Navigator.of(context).pushReplacementNamed(RouteNames.privacy);
      return;
    }
    setState(() {
      currentStep += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: increaseStep,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: images[currentStep].image,
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getStepInfo(currentStep)['title'] ?? 'Default title',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                const SizedBox(height: 5),
                Text(
                  getStepInfo(currentStep)['subtitle'] ?? 'Default Subtitle',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.5),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
