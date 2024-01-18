import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_17/controllers/controllers/quiz_controller.dart';
import 'package:pp_17/data/models/quiz_entity.dart';
import 'package:pp_17/helpers/image/image_helper.dart';
import 'package:pp_17/presentation/themes/custom_colors.dart';
import 'package:pp_17/presentation/widgets/app_button.dart';
import 'package:pp_17/presentation/widgets/fillable_divider.dart';

class QuizzesView extends StatefulWidget {
  const QuizzesView({super.key, required this.quizzes});

  final List<Quiz> quizzes;

  @override
  State<QuizzesView> createState() => _QuizzesViewState();
}

class _QuizzesViewState extends State<QuizzesView> {
  final quizController = GetIt.instance.get<QuizController>();

  void onStartTest() {
    quizController.start(widget.quizzes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        color: Theme.of(context).colorScheme.surface,
        child: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: quizController,
            builder: (BuildContext context, QuizControllerState state, Widget? child) {
              switch (state.status) {
                case QuizzesStatus.idle:
                  return QuizIdleView(onStartTest: onStartTest);
                case QuizzesStatus.progress:
                  return QuizProgressView(
                    activeQuiz: state.activeQuiz!,
                    quizzesLength: state.quizzes.length,
                    quizIndex: state.quizzes.indexOf(state.activeQuiz!),
                  );
                case QuizzesStatus.finish:
                  return QuizFinishView(
                    rightAnswers: state.rightAnswers,
                    quizzesLength: state.quizzes.length,
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}

class QuizIdleView extends StatelessWidget {
  const QuizIdleView({super.key, required this.onStartTest});

  final VoidCallback onStartTest;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FillableDivider(
          fillPercentage: 100,
          width: double.infinity,
          color: const Color(0xFFFF4B00).withOpacity(0.3),
          filledColor: const Color(0xFFFF4B00),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Shall we do a quiz?', style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(height: 10),
                    Text(
                      'Interactive quiz, answer the questions!',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              ImageHelper.getImage(ImageNames.quiz),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppButton(
                    name: 'Start',
                    callback: onStartTest,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    textColor: Theme.of(context).colorScheme.secondary,
                  ),
                  AppButton(
                    name: 'maybe,later',
                    textStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
                    callback: () => Navigator.of(context).pop(),
                    backgroundColor: Colors.transparent,
                    textColor: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class QuizProgressView extends StatefulWidget {
  QuizProgressView({
    super.key,
    required this.activeQuiz,
    required this.quizzesLength,
    required this.quizIndex,
  });

  final Quiz activeQuiz;
  final int quizzesLength;
  final int quizIndex;
  bool isPassed = false;
  String selectedAnswer = '';

  @override
  State<QuizProgressView> createState() => _QuizProgressViewState();
}

class _QuizProgressViewState extends State<QuizProgressView> {
  final quizController = GetIt.instance.get<QuizController>();

  void selectAnswer(String answer) {
    if (widget.selectedAnswer.isNotEmpty) {
      return;
    }
    setState(() {
      widget.selectedAnswer = answer;
    });

    checkAnswer();
  }

  void checkAnswer() {
    if (widget.selectedAnswer == widget.activeQuiz.rightAnswer) {
      quizController.incAnswers();
      setState(() {
        widget.isPassed = true;
      });
    } else {
      setState(() {
        widget.isPassed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FillableDivider(
          fillPercentage: 100,
          width: double.infinity,
          color: const Color(0xFFFF4B00).withOpacity(0.3),
          filledColor: const Color(0xFFFF4B00),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.activeQuiz.name, style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(height: 10),
                    Text(
                      'Questions ${widget.quizIndex + 1} / ${widget.quizzesLength}',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
                    ),
                    const SizedBox(height: 27),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                              color: Theme.of(context).extension<CustomColors>()!.blue!)),
                      child: Text(
                        widget.activeQuiz.question,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Theme.of(context).extension<CustomColors>()!.blue),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      runSpacing: 10,
                      children: [
                        ...widget.activeQuiz.answers.map((e) => GestureDetector(
                              onTap: () => selectAnswer(e),
                              child: AnswerContainer(
                                answer: e,
                                selectedAnswer: widget.selectedAnswer,
                                isPassed: widget.isPassed,
                              ),
                            )),
                      ],
                    )
                  ],
                ),
                AppButton(
                  name: widget.quizIndex + 1 < widget.quizzesLength ? 'Next' : 'Finish',
                  callback: widget.selectedAnswer.isNotEmpty ? () => quizController.next() : null,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.secondary,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class AnswerContainer extends StatefulWidget {
  const AnswerContainer(
      {super.key, required this.isPassed, required this.answer, required this.selectedAnswer});

  final bool isPassed;
  final String answer;
  final String selectedAnswer;

  @override
  State<AnswerContainer> createState() => _AnswerContainerState();
}

class _AnswerContainerState extends State<AnswerContainer> {
  final quizController = GetIt.instance.get<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: widget.selectedAnswer == widget.answer
            ? widget.isPassed
                ? Colors.green
                : Colors.red
            : Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(
        widget.answer,
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}

class QuizFinishView extends StatelessWidget {
  const QuizFinishView({
    super.key,
    required this.rightAnswers,
    required this.quizzesLength,
  });

  final int rightAnswers;
  final int quizzesLength;

  @override
  Widget build(BuildContext context) {
    final finishImage = quizzesLength == rightAnswers
        ? ImageHelper.getImage(ImageNames.quizSuccess)
        : ImageHelper.getImage(ImageNames.quizFail);

    final title = quizzesLength == rightAnswers ? 'King score!' : 'Unfortunately score!';

    final subTitle = quizzesLength == rightAnswers
        ? 'You have successfully completed the lesson, now you have access to the next one!'
        : "That's okay, research the info and try again.";

    return Column(
      children: [
        FillableDivider(
          fillPercentage: 100,
          width: double.infinity,
          color: const Color(0xFFFF4B00).withOpacity(0.3),
          filledColor: const Color(0xFFFF4B00),
        ),
        Expanded(
          child: Column(
            children: [
              const Spacer(flex: 1),
              Column(
                children: [
                  Stack(alignment: Alignment.center, children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: quizzesLength == rightAnswers
                                ? Theme.of(context).colorScheme.primary.withOpacity(0.7)
                                : Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                            blurRadius: 25,
                          )
                        ],
                        borderRadius: BorderRadius.circular(999),
                      ),
                      width: 232,
                      height: 232,
                    ),
                    finishImage,
                  ]),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Theme.of(context).colorScheme.secondary),
                  ),
                  Text(
                    subTitle,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Theme.of(context).colorScheme.secondary),
                  ),
                  Text('$rightAnswers / $quizzesLength'),
                ],
              ),
              const Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: AppButton(
                  name: 'Back',
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  callback: () {
                    final quizController = GetIt.instance.get<QuizController>();
                    Navigator.of(context).pop();
                    quizController.resetStats();
                  },
                  textColor: Theme.of(context).extension<CustomColors>()!.blue!,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
