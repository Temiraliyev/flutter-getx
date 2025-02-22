// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getx/ui/pages/Cart.dart';
import 'package:getx/ui/pages/home.dart';
import 'package:getx/ui/pages/orders.dart';
import 'package:getx/ui/pages/profile.dart';
import 'package:getx/ui/widgets/custom_bottom_nav.dart';
import 'package:getx/ui/widgets/fade_indexed_stack.dart';
import 'package:heroicons/heroicons.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  int selectedPage = 0;
  List<CustomBottomNavItem> contents = [
    CustomBottomNavItem(Home(), "assets/images/home.png"),
    CustomBottomNavItem(Cart(), "assets/images/cart.png"),
    CustomBottomNavItem(Orders(), "assets/images/orders.png"),
    CustomBottomNavItem(Profile(), "assets/images/profile.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: FadeIndexedStack(
        index: selectedPage,
        children: contents.map((e) => e.content).toList(),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.all(
            TextStyle(
              fontSize: 12,
              // color: isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        child: NavigationBar(
          height: 58,

          backgroundColor: Theme.of(
            context,
          ).scaffoldBackgroundColor.withOpacity(0.1),
          indicatorColor: Theme.of(context).primaryColor.withOpacity(0.3),
          onDestinationSelected: (value) {
            setState(() {
              selectedPage = value;
            });
          },
          selectedIndex: selectedPage,
          destinations: <Widget>[
            NavigationDestination(
              icon: const HeroIcon(HeroIcons.home),
              selectedIcon: const HeroIcon(
                HeroIcons.home,
                style: HeroIconStyle.solid,
              ),
              label: "home".tr(),
            ),
            NavigationDestination(
              icon: const HeroIcon(HeroIcons.shoppingCart),
              selectedIcon: const HeroIcon(
                HeroIcons.shoppingCart,
                style: HeroIconStyle.solid,
              ),
              label: "cart".tr(),
            ),
            NavigationDestination(
              icon: const HeroIcon(HeroIcons.shoppingBag),
              selectedIcon: const HeroIcon(
                HeroIcons.shoppingBag,
                style: HeroIconStyle.solid,
              ),
              label: "orders".tr(),
            ),
            NavigationDestination(
              icon: const HeroIcon(HeroIcons.user, size: 28),
              selectedIcon: const HeroIcon(
                HeroIcons.user,
                style: HeroIconStyle.solid,
              ),
              label: "profile".tr(),
            ),
          ],
        ),
      ),
    );

    // PopScope(
    //   canPop: true,
    //   child: Scaffold(
    //     body: SafeArea(
    //       top: false,
    //       child: FadeIndexedStack(
    //         index: selectedPage,
    //         children: contents.map((e) => e.content).toList(),
    //       ),
    //     ),
    //     bottomNavigationBar: SafeArea(
    //       child: CustomBottomNav(
    //         onChange: (index) {
    //           setState(() {
    //             selectedPage = index;
    //           });
    //         },
    //         items: contents,
    //       ),
    //     ),
    //   ),
    // );
  }
}
