import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pp_17/controllers/services/navigation/route_names.dart';
import 'package:pp_17/data/models/news_model.dart';
import 'package:pp_17/helpers/image/image_helper.dart';
import 'package:pp_17/presentation/widgets/fillable_divider.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.of(context).pushNamed(RouteNames.news, arguments: news);
      },
      child: Container(
        height: 143,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 28),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                news.title,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            Expanded(
              flex: 1,
              child: Image(
                image: AssetImage(news.iconPath),
              ),
            )
          ],
        ),
      ),
    );
  }
}
