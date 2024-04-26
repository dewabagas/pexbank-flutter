import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pexbank/presentation/core/constants/assets.dart';
import 'package:pexbank/presentation/core/constants/styles.dart';
import 'package:pexbank/presentation/core/styles/app_colors.dart';
import 'package:pexbank/presentation/dashboard/tabs/tab_home.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_svg/svg.dart';

class PageDashboard extends StatefulWidget {
  final int? tabIndex;

  const PageDashboard({super.key, this.tabIndex});

  @override
  State<PageDashboard> createState() => _PageDashboardState();
}

class _PageDashboardState extends State<PageDashboard> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.tabIndex ?? 0;
    FlutterNativeSplash.remove();
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(BottomBar.icHome),
          inactiveIcon: SvgPicture.asset(BottomBar.icHome)),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(BottomBar.icChart),
          inactiveIcon: SvgPicture.asset(BottomBar.icChart)),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(BottomBar.icMarket),
          inactiveIcon: SvgPicture.asset(BottomBar.icMarket)),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(BottomBar.icArrowTrending),
          inactiveIcon: SvgPicture.asset(BottomBar.icArrowTrending)),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(BottomBar.icWallet),
          inactiveIcon: SvgPicture.asset(BottomBar.icWallet)),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      const TabHome(),
      const TabHome(),
      const TabHome(),
      const TabHome(),
      const TabHome(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: _currentIndex),
      screens: _buildScreens(),
      items: _navBarItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.primary,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.transparent,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -5),
            blurRadius: 14,
            spreadRadius: 0,
            color: const Color(0xFFCBCDCE).withOpacity(0.18),
          ),
        ],
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      navBarHeight: 64.h,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style12,
    );
  }
}
