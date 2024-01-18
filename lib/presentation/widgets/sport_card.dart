import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pp_17/data/models/sport_card_entity.dart';
import 'package:pp_17/helpers/image/image_helper.dart';
import 'package:pp_17/presentation/widgets/fillable_divider.dart';

class SportCardWidget extends StatelessWidget {
  const SportCardWidget({super.key, required this.sportCard, required this.callback});

  final SportCard sportCard;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: 211,
        width: 156,
        decoration: BoxDecoration(
            color: Theme
                .of(context)
                .colorScheme
                .secondary, borderRadius: BorderRadius.circular(10)),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  sportCard.name,
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Theme
                      .of(context)
                      .colorScheme
                      .onPrimary),
                ),
                const SizedBox(height: 5),
                Text(
                  sportCard.quizStatus.name,
                  style: Theme
                      .of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Theme
                      .of(context)
                      .colorScheme
                      .onPrimary
                      .withOpacity(0.5)),
                ),
                const SizedBox(height: 14),
                FillableDivider(
                  fillPercentage: 90,
                  width: 124,
                  color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
                  filledColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: ImageHelper.getImage(
                ImageNames.footballCard,
                // sportCard.imagePath,
                fit: BoxFit.fitHeight,
              ))
        ]),
      ),
    );
  }
}
