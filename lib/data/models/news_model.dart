import 'package:hive/hive.dart';

part 'news_model.g.dart';

@HiveType(typeId: 11)
class News extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final String imagePath;
  @HiveField(3)
  final String iconPath;

  News({required this.title, required this.text, required this.imagePath, required this.iconPath});

  News copyWith({String? title, String? text, String? imagePath, String? iconPath}) => News(
        title: title ?? this.title,
        text: text ?? this.text,
        imagePath: imagePath ?? this.imagePath,
        iconPath: iconPath ?? this.iconPath,
      );
}
