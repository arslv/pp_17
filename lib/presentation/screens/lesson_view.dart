import 'package:flutter/material.dart';
import 'package:pp_17/controllers/controllers/lesson_controller.dart';
import 'package:pp_17/controllers/services/navigation/route_names.dart';
import 'package:pp_17/data/models/sport_card_entity.dart';
import 'package:pp_17/data/models/step_entity.dart';
import 'package:pp_17/presentation/widgets/app_button.dart';
import 'package:pp_17/presentation/widgets/fillable_divider.dart';

class LessonView extends StatefulWidget {
  const LessonView({super.key, required this.sportCard});

  final SportCard sportCard;

  @override
  State<LessonView> createState() => _LessonViewState();
}

class _LessonViewState extends State<LessonView> {
  var steps = <LessonStep>[];
  var currentStep = 0;
  late final LessonController _lessonController;

  void init() {
    _lessonController = LessonController();
    steps = widget.sportCard.lesson.splitTextIntoSteps(300);
  }

  void _increaseStep() {
    if (currentStep + 1 < steps.length) {
      setState(() {
        currentStep += 1;
      });
    } else if (currentStep + 1 == steps.length) {
      if (!widget.sportCard.lesson.isPassed) {
        _lessonController.passLesson(widget.sportCard);
      }
      Navigator.of(context)
          .pushReplacementNamed(RouteNames.quizzes, arguments: widget.sportCard.quizzes);
    }
  }

  void _decreaseStep() {
    if (currentStep - 1 > -1) {
      setState(() {
        currentStep -= 1;
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stepProgress = (((currentStep + 1) / steps.length) * 100).round();

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(top: 20),
          color: Theme.of(context).colorScheme.surface,
          child: SafeArea(
            child: Column(
              children: [
                FillableDivider(
                  fillPercentage: stepProgress,
                  width: double.infinity,
                  color: const Color(0xFFFF4B00).withOpacity(0.3), //TODO в appthemes
                  filledColor: const Color(0xFFFF4B00),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.sportCard.name, style: Theme.of(context).textTheme.labelLarge),
                        const SizedBox(height: 20),
                        Text(
                          steps[currentStep].text,
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
                        ),
                        const SizedBox(height: 10),
                        Text('Step ${currentStep + 1}/${steps.length}'),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppButton(
                                name: 'Back',
                                callback: _decreaseStep,
                                backgroundColor: Theme.of(context).colorScheme.secondary,
                                textColor: Theme.of(context).colorScheme.onPrimary,
                              ),
                              AppButton(
                                name: currentStep + 1 == steps.length ? 'Finish' : 'Next',
                                callback: _increaseStep,
                                backgroundColor: Theme.of(context).colorScheme.primary,
                                textColor: Theme.of(context).colorScheme.secondary,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
