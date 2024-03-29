// ignore_for_file: must_be_immutable
import 'package:fakecommerce/bloc/cart/cart_cubit.dart';
import 'package:fakecommerce/bloc/cart/cart_state.dart';
import 'package:fakecommerce/bloc/nav_bar_index/index_cubit.dart';
import 'package:fakecommerce/bloc/nav_bar_index/index_state.dart';
import 'package:fakecommerce/layout/screens/bottom_nav_bar/categories_screen.dart';
import 'package:fakecommerce/layout/screens/bottom_nav_bar/favorites_screen.dart';
import 'package:fakecommerce/layout/screens/bottom_nav_bar/home_screen.dart';
import 'package:fakecommerce/layout/screens/bottom_nav_bar/profile_screen.dart';
import 'package:fakecommerce/layout/screens/cart_screen.dart';
import 'package:fakecommerce/layout/widgets/bottom_tab_bar.dart';
import 'package:fakecommerce/utilities/context_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  static late BuildContext mainContext;
  static const String routeName = '/';

  MainScreen({super.key});
  final List<Widget> _pages = const [
    HomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    ProfileScreen()
  ];
  DateTime timeBackPressed = DateTime.now();
  @override
  Widget build(BuildContext context) {
    mainContext = context;
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
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Press back again to exit',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: context.tertiary,
              ));
              return false;
            } else {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              return true;
            }
          },
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) => Badge(
                backgroundColor: context.secondaryColor,
                offset: Offset(-2, 2),
                isLabelVisible: true,
                label: Text(
                  state.products.length.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  backgroundColor: context.primaryColor,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 35,
                  ),
                ),
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
