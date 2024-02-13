import 'package:fakecommerce/bloc/favorites/favorites_cubit.dart';
import 'package:fakecommerce/bloc/favorites/favorites_states.dart';
import 'package:fakecommerce/data/models/product.dart';
import 'package:fakecommerce/layout/screens/product_details_screen.dart';
import 'package:fakecommerce/utilities/context_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/web_symbols_icons.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,
            arguments: {"product": product});
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          // boxShadow: [
          //   BoxShadow(
          //       blurRadius: 3,
          //       spreadRadius: 0,
          //       color: Colors.grey[400]!,
          //       offset: Offset(1, 1)),
          // ],
        ),
        child: Stack(children: [
          Column(
            children: [
              SizedBox(
                width: context.width * 0.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                    tag: product.id!,
                    child: FadeInImage(
                      placeholder: AssetImage('assets/images/purple_logo.png'),
                      image: NetworkImage(product.image!),
                      fadeInDuration: Duration(seconds: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(product.title!, textAlign: TextAlign.center),
              )
            ],
          ),
          BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) => Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  state.ids.contains(product.id)
                      ? BlocProvider.of<FavoritesCubit>(context)
                          .removeFavorite(id: product.id!)
                      : BlocProvider.of<FavoritesCubit>(context)
                          .addFavorite(product: product);
                },
                child: Icon(state.ids.contains(product.id)
                    ? WebSymbols.heart
                    : WebSymbols.heart_empty),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
