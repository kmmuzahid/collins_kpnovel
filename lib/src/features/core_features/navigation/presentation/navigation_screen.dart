import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tamplates/config/route/app_router.dart';
import 'package:riverpod_tamplates/config/theme/app_theme_data.dart';
import 'package:riverpod_tamplates/gen/assets.gen.dart';

@RoutePage()
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [ReadRoute(), HomeRoute(), ExploreRoute(), ContestRoute(), LibraryRoute()],
      bottomNavigationBuilder: (_, tabsRouter) {
        return MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          child: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              _navBuilder(context, tabsRouter, Assets.nav.navRead, 'Read', 0),
              _navBuilder(context, tabsRouter, Assets.nav.navHome, 'Home', 1),
              _navBuilder(context, tabsRouter, Assets.nav.navExplore, 'Explore', 2),
              _navBuilder(context, tabsRouter, Assets.nav.navContest, 'Contest', 3),
              _navBuilder(context, tabsRouter, Assets.nav.navLibrary, 'Library', 4),
            ],
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _navBuilder(
    BuildContext context,
    TabsRouter tabsRouter,
    String src,
    String label,
    int index,
  ) {
    final isActive = tabsRouter.activeIndex == index;

    return BottomNavigationBarItem(
      label: '',
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getIcon(isActive, context, src),
          CommonText(
            text: label,
            textColor: isActive ? null : context.color.navbarIconsUnselected,
            fontSize: isActive ? 14 : 12,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            gradient: isActive ? context.color.ctaGradientBackgroundAccent : null,
          ),
        ],
      ),
    );
  }

  StatelessWidget _getIcon(bool isActive, BuildContext context, String image) {
    final icon = CommonImage(
      src: image,
      size: 24 * (isActive ? 1.1 : 1),
      imageColor: isActive ? context.color.buttonTextWhite : context.color.navbarIconsUnselected,
    );
    return isActive
        ? Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: context.color.ctaGradientBackgroundAccent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: context.color.purple400,
                  blurRadius: 4,
                  spreadRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: icon,
          )
        : icon;
  }
}
