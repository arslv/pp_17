import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pp_17/controllers/services/navigation/navigation_observer.dart';
import 'package:pp_17/controllers/services/navigation/route_names.dart';
import 'package:pp_17/controllers/services/navigation/routes.dart';
import 'package:pp_17/controllers/services/service_locator.dart';
import 'package:pp_17/presentation/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final serviceLocator = ServiceLocator();
  await serviceLocator.setup();

  runApp(const SportQuiz());
}

class SportQuiz extends StatelessWidget {
  const SportQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main',
      routes: Routes.get(context),
      initialRoute: RouteNames.splash,
      theme: DefaultThemeGetter.get(),
      navigatorObservers: [CustomNavigatorObserver()],
    );
  }
}
