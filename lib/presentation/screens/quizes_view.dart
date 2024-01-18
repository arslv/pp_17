import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  late final QuizController _quizController;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    _quizController = QuizController(
      QuizControllerState(quizzes: widget.quizzes),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        color: Theme.of(context).colorScheme.surface,
        child: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: _quizController,
            builder: (context, state, child) {
              switch (state.status) {
                case QuizzesStatus.idle:
                  return QuizIdleView(
                    startQuiz: _quizController.startQuiz,
                  );
                case QuizzesStatus.progress:
                  return QuizProgressView(
                    quizzes: state.quizzes,
                    endQuiz: _quizController.endQuiz,
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
  const QuizIdleView({
    super.key,
    required this.startQuiz,
  });

  final VoidCallback startQuiz;

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
                    Text('Shall we do a quiz?',
                        style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(height: 10),
                    Text(
                      'Interactive quiz, answer the questions!',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.5)),
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
                    callback: startQuiz,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    textColor: Theme.of(context).colorScheme.secondary,
                  ),
                  AppButton(
                    name: 'maybe,later',
                    textStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5)),
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
  const QuizProgressView({
    super.key,
    required this.quizzes,
    required this.endQuiz,
  });

  final List<Quiz> quizzes;
  final void Function(int) endQuiz;

  @override
  State<QuizProgressView> createState() => _QuizProgressViewState();
}

class _QuizProgressViewState extends State<QuizProgressView> {
  var _currentStep = 0;

  List<Quiz> get _quizzes => widget.quizzes;

  var _rigthAnswers = 0;

  String? _selectedAnswer;

  var _quizStatus = CurrentQuizStatus.idle;

  bool get _isLastQuestion => _currentStep == _quizzes.length - 1;

  Future<void> _next() async {
    setState(() => _quizStatus = CurrentQuizStatus.answered);
    await Future.delayed(const Duration(milliseconds: 1500));
    if (_selectedAnswer == _quizzes[_currentStep].rightAnswer) {
      _rigthAnswers++;
    }
    if (_isLastQuestion) {
      widget.endQuiz.call(_rigthAnswers);
    } else {
      setState(() {
        _quizStatus = CurrentQuizStatus.idle;
        _selectedAnswer = null;
        _currentStep++;
      });
    }
  }

  void _selectAnswer(String selectedAnswer) =>
      setState(() => _selectedAnswer = selectedAnswer);

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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_quizzes[_currentStep].name,
                          style: Theme.of(context).textTheme.labelLarge),
                      const SizedBox(height: 10),
                      Text(
                        'Questions ${_currentStep + 1} / ${_quizzes.length}',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.5)),
                      ),
                      const SizedBox(height: 27),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                                color: Theme.of(context)
                                    .extension<CustomColors>()!
                                    .blue!)),
                        child: Text(
                          _quizzes[_currentStep].question,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  color: Theme.of(context)
                                      .extension<CustomColors>()!
                                      .blue),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            final answer =
                                _quizzes[_currentStep].answers[index];
                            return _AnswerTile(
                              isSelected: _selectedAnswer == answer,
                              answer: answer,
                              onPressed: () => _selectAnswer(answer),
                              isAnswered:
                                  _quizStatus == CurrentQuizStatus.answered,
                              isRigth: _selectedAnswer ==
                                  _quizzes[_currentStep].rightAnswer,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: _quizzes[_currentStep].answers.length,
                        ),
                      )
                    ],
                  ),
                ),
                AppButton(
                  name: _isLastQuestion ? 'Finish' : 'Next',
                  callback: _selectedAnswer == null ? null : _next,
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

class _AnswerTile extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final bool isAnswered;
  final bool isRigth;
  final VoidCallback onPressed;
  const _AnswerTile({
    required this.isSelected,
    required this.answer,
    required this.onPressed,
    required this.isAnswered,
    required this.isRigth,
  });

  Color _getTextColor() {
    if (isSelected) {
      if (isAnswered) {
        if (isRigth) {
          return Colors.green;
        } else {
          return Colors.red;
        }
      } else {
        return Colors.black;
      }
    } else {
      return Colors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Row(
        children: [
          Expanded(
            child: Text(
              answer,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: _getTextColor(),
                  ),
            ),
          ),
        ],
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

    final title =
        quizzesLength == rightAnswers ? 'King score!' : 'Unfortunately score!';

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
                                ? Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.7)
                                : Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.7),
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
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  Text(
                    subTitle,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
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
                  callback: Navigator.of(context).pop,
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

enum CurrentQuizStatus {
  idle,
  answered,
}
