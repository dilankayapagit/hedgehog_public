import 'package:flutter/services.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../home_menu_page/home_menu_page.dart';
import '../lock_page/four_page.dart';
import '../profile_screen/seven_screen.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final Color navigationBarColor = Colors.white;

  int selectedIndex = 0;

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: PageView(
          allowImplicitScrolling: true,
          onPageChanged: (num) {
            selectedIndex = num;
            setState(() {});
          },
          //physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            HomeMenuPage(),
            FourPage(),
            SevenScreen(),
          ],
        ),
        bottomNavigationBar: WaterDropNavBar(
          backgroundColor: navigationBarColor,
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          selectedIndex: selectedIndex,
          barItems: <BarItem>[
            BarItem(
              filledIcon: Icons.home,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
              filledIcon: Icons.lock,
              outlinedIcon: Icons.lock_outline,
            ),
            BarItem(
              filledIcon: Icons.person,
              outlinedIcon: Icons.person_outline,
            ),
          ],
        ),
      ),
    );
  }
}
