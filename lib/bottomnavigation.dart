import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'main.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  NavigationBarState createState() => NavigationBarState();
}

class NavigationBarState extends State<NavigationBar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [Profile(), Setting(), Notifications()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(IconlyBroken.profile),
        title: 'Profile',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white.withOpacity(0.5),
        inactiveColorSecondary: Colors.white.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(IconlyBroken.setting),
        title: 'Setting',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white.withOpacity(0.5),
        inactiveColorSecondary: Colors.white.withOpacity(0.5),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/first': (context) => Profile(),
            '/second': (context) => Setting(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(IconlyBroken.notification),
        title: 'Notification',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white.withOpacity(0.5),
        inactiveColorSecondary: Colors.white.withOpacity(0.5),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/first': (context) => Profile(),
            '/second': (context) => Setting(),
            '/third': (context) => Notifications(),
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style14,
      backgroundColor: Colors.deepPurple,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(15),
        colorBehindNavBar: Colors.blue,
      ),
    );
  }
}
