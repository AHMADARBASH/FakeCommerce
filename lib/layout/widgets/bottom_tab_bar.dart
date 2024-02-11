import 'package:fakecommerce/bloc/nav_bar_index/index_cubit.dart';
import 'package:fakecommerce/bloc/nav_bar_index/index_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/entypo_icons.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavbarState>(
      builder: (context, state) => BottomNavigationBar(
        iconSize: 20,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        unselectedItemColor:
            Theme.of(context).colorScheme.primary.withOpacity(0.4),
        currentIndex: state.index,
        onTap: (index) {
          BlocProvider.of<BottomNavBarCubit>(context).changeNavBarIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Elusive.home,
              size: 17,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Entypo.layout,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Elusive.cogs,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
