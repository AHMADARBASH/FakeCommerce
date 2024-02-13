import 'package:animate_do/animate_do.dart';
import 'package:fakecommerce/bloc/favorites/favorites_cubit.dart';
import 'package:fakecommerce/bloc/favorites/favorites_states.dart';
import 'package:fakecommerce/layout/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) => state is FavoritesLoadingState
          ? const Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            )
          : state is FavoritesErrorState
              ? Text(state.errorMessage)
              : state is FavoritesEmptyState
                  ? Center(child: Text('you have no Favorites Items'))
                  : Expanded(
                      child: MasonryGridView.builder(
                        itemCount: state.favorites.length,
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        padding: EdgeInsets.all(5),
                        itemBuilder: (context, index) => FadeInUp(
                          curve: Curves.easeOutCubic,
                          delay: Duration(milliseconds: 75 * index),
                          child: ProductWidget(
                            product: state.favorites[index],
                          ),
                        ),
                      ),
                    ),
    ));
  }
}
