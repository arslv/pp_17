import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pp_17/data/models/news_model.dart';
import 'package:pp_17/helpers/image/image_helper.dart';
import 'package:pp_17/presentation/themes/custom_colors.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          padding: const EdgeInsets.all(20),
          color: Theme.of(context).colorScheme.surface,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: const Offset(-10, 0),
                  child: CupertinoButton(
                    child: ImageHelper.svgImage(SvgNames.chevronLeft),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage(news.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 33),
                Text(
                  news.stringDateTime,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                        fontStyle: FontStyle.italic,
                      ),
                ),
                const SizedBox(height: 20),
                Text(
                  news.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).extension<CustomColors>()!.blue),
                ),
                const SizedBox(height: 10),
                Text(
                  news.text,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
