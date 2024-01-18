import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pp_17/helpers/image/image_helper.dart';
import 'package:pp_17/presentation/screens/home_view.dart';
import 'package:pp_17/presentation/screens/settings_view.dart';
import 'package:pp_17/presentation/screens/sport_cards_view.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> pages = [const HomeView(), const SportCardsView(), const SettingsView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 66,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageHelper.svgImage(SvgNames.home),
              activeIcon: ImageHelper.svgImage(SvgNames.homeSelected),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageHelper.svgImage(SvgNames.cards),
              activeIcon: ImageHelper.svgImage(SvgNames.cardsSelected),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageHelper.svgImage(SvgNames.settings),
              activeIcon: ImageHelper.svgImage(SvgNames.settingsSelected),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}