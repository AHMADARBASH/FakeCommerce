// ignore_for_file: must_be_immutable

import 'package:fakecommerce/bloc/nav_bar_index/index_cubit.dart';
import 'package:fakecommerce/bloc/nav_bar_index/index_state.dart';
import 'package:fakecommerce/layout/screens/bottom_nav_bar/categories_screen.dart';
import 'package:fakecommerce/layout/screens/bottom_nav_bar/favorites_screen.dart';
import 'package:fakecommerce/layout/screens/bottom_nav_bar/home_screen.dart';
import 'package:fakecommerce/layout/screens/bottom_nav_bar/settings_screen.dart';
import 'package:fakecommerce/layout/widgets/bottom_tab_bar.dart';
import 'package:fakecommerce/utilities/context_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = '/';
  MainScreen({super.key});
  final List<Widget> _pages = [
    HomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen()
  ];
  DateTime timeBackPressed = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavbarState>(
      builder: (context, state) => SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            var difference = DateTime.now().difference(timeBackPressed);
            var isExitWarning = difference >= const Duration(seconds: 2);
            timeBackPressed = DateTime.now();
            if (state.index > 0) {
              context.read<BottomNavBarCubit>().changeNavBarIndex(0);
              return false;
            } else if (isExitWarning) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Press back again to exit')));
              return false;
            } else {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              return true;
            }
          },
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: context.primaryColor,
              child: Image.asset(
                'assets/images/logo.png',
                width: 35,
              ),
            ),
            body: _pages[state.index],
            bottomNavigationBar: NavBar(),
          ),
        ),
      ),
    );
  }
}
