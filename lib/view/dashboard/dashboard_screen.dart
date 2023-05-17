import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tailor_app/view/dashboard/orders/order_screen.dart';
import 'package:tailor_app/view/dashboard/profile/profile.dart';
import 'package:tailor_app/view/dashboard/users/user_list_screen.dart';

import '../../resources/color.dart';
import 'google_map/map.dart';
import 'home/home_screen.dart';
import 'orders/create_order_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<Widget> _buildScreen() {
    return [
      HomeScreen(),
      CreateOrderScreen(),
      const OrderScreen(),
      GoogleMapScreen(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItem() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.home,
        ),
        title: ('Home'),
        textStyle: Theme.of(context).textTheme.titleSmall,
        inactiveIcon: Icon(
          Icons.home,
          color: Colors.grey.shade100,
        ),
        activeColorPrimary: AppColors.primaryIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.person_add,
        ),
        title: 'New Order',
        textStyle: Theme.of(context).textTheme.titleSmall,
        inactiveIcon: Icon(
          Icons.person_add,
          color: Colors.grey.shade100,
        ),
        activeColorPrimary: AppColors.primaryIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.list_outlined,
        ),
        title: 'Orders',
        textStyle: Theme.of(context).textTheme.titleSmall,
        inactiveIcon: Icon(
          Icons.list_outlined,
          color: Colors.grey.shade100,
        ),
        activeColorPrimary: AppColors.primaryIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.chat_bubble,
        ),
        title: 'Map',
        textStyle: Theme.of(context).textTheme.titleSmall,
        inactiveIcon: Icon(
          Icons.chat_bubble,
          color: Colors.grey.shade100,
        ),
        activeColorPrimary: AppColors.primaryIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.profile_circled,
        ),
        title: 'Profile',
        textStyle: Theme.of(context).textTheme.titleSmall,
        inactiveIcon: Icon(
          CupertinoIcons.profile_circled,
          color: Colors.grey.shade100,
        ),
        activeColorPrimary: AppColors.primaryIconColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreen(),
      items: _navBarItem(),
      backgroundColor: AppColors.otpHintColor,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
