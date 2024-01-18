import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_17/controllers/services/navigation/route_names.dart';
import 'package:pp_17/data/database/data_base.dart';
import 'package:pp_17/data/database/database_keys.dart';
import 'package:pp_17/helpers/image/image_helper.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void navigate() async {
    final dataBase = GetIt.instance.get<DataBase>();
    final isFirstLaunch = dataBase.get(DatabaseKeys.isFirstLaunch) ?? true;

    Timer(const Duration(seconds: 2), () {
      if (isFirstLaunch) {
        Navigator.of(context).pushReplacementNamed(RouteNames.onboarding);
        dataBase.put(DatabaseKeys.isFirstLaunch, false);
      } else {
        Navigator.of(context).pushReplacementNamed(RouteNames.mainScreen);
      }
    });
  }

  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageHelper.svgImage(SvgNames.logo),
            const SizedBox(height: 35),
            Text(
              'APPNAME',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            )
          ],
        ),
      ),
    );
  }
}
