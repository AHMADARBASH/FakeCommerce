import 'dart:ui';
import 'package:fakecommerce/bloc/cart/cart_cubit.dart';
import 'package:fakecommerce/bloc/cart/cart_state.dart';
import 'package:fakecommerce/bloc/favorites/favorites_cubit.dart';
import 'package:fakecommerce/bloc/favorites/favorites_states.dart';
import 'package:fakecommerce/data/models/product.dart';
import 'package:fakecommerce/layout/screens/cart_screen.dart';
import 'package:fakecommerce/utilities/context_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = '/ProductDetilsScreen';
  final Product product;
  const ProductDetailsScreen({required this.product, super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      backgroundColor: context.tertiary,
      appBar: AppBar(
        backgroundColor: context.tertiary,
        elevation: 0,
        actions: [
          FadeInRight(
              duration: Duration(milliseconds: 400),
              delay: Duration(milliseconds: 800),
              curve: Curves.easeOutQuad,
              child: BlocBuilder<FavoritesCubit, FavoritesState>(
                builder: (context, state) => Container(
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      state.ids.contains(widget.product.id)
                          ? BlocProvider.of<FavoritesCubit>(context)
                              .removeFavorite(id: widget.product.id!)
                          : BlocProvider.of<FavoritesCubit>(context)
                              .addFavorite(product: widget.product);
                    },
                    child: Icon(
                      state.ids.contains(widget.product.id)
                          ? WebSymbols.heart
                          : WebSymbols.heart_empty,
                      color: context.primaryColor,
                    ),
                  ),
                ),
              )),
        ],
      ),
      body: Stack(alignment: Alignment.topRight, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                width: context.width,
                decoration: BoxDecoration(),
                child: Hero(
                  tag: widget.product.id!,
                  child: Image.network(
                    widget.product.image!,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 3,
              child: FadeInUp(
                duration: Duration(milliseconds: 400),
                delay: Duration(milliseconds: 500),
                curve: Curves.easeOutQuad,
                child: Container(
                  width: context.width,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: context.tertiary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          spreadRadius: 1,
                          color: Colors.grey[300]!,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.title!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 25),
                        maxLines: 3,
                        overflow: TextOverflow.visible,
                      ),
                      Text(
                        widget.product.description!,
                        maxLines: 3,
                      ),

                      //make a gap between Title and Lower grey Container
                      const Expanded(
                        child: SizedBox(),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: context.width,
                        height: context.height * 0.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FadeInLeft(
                              duration: Duration(milliseconds: 400),
                              delay: Duration(milliseconds: 700),
                              curve: Curves.easeOutQuad,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.product.price!.toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  Text(
                                    ' \$',
                                    style: TextStyle(fontFeatures: [
                                      FontFeature.enable('sups')
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            BlocBuilder<CartCubit, CartState>(
                              builder: (context, state) => FadeInRight(
                                duration: Duration(milliseconds: 400),
                                delay: Duration(milliseconds: 700),
                                curve: Curves.easeOutQuad,
                                child: Row(
                                  children: [
                                    ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: cartCubit.products
                                                .contains(widget.product)
                                            ? Colors.grey
                                            : context.primaryColor,
                                      ),
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        if (cartCubit.products
                                            .contains(widget.product)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Item already in cart',
                                              ),
                                              backgroundColor:
                                                  context.secondaryColor,
                                              action: SnackBarAction(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          CartScreen.routeName);
                                                },
                                                label: 'view cart',
                                              ),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Item added',
                                              ),
                                            ),
                                          );
                                          cartCubit.addProduct(widget.product);
                                        }
                                      },
                                      icon: Image.asset(
                                        'assets/images/logo.png',
                                        width: 25,
                                        height: 25,
                                      ),
                                      label: Text(
                                        'Add to cart',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: context.tertiary,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeInLeft(
              duration: Duration(milliseconds: 400),
              delay: Duration(milliseconds: 1000),
              curve: Curves.easeOutQuad,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: context.primaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    padding: EdgeInsets.only(right: 15, left: 5),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        ' ${widget.product.category!.toString()}',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: context.tertiary,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FadeInRight(
              duration: Duration(milliseconds: 400),
              delay: Duration(milliseconds: 1000),
              curve: Curves.easeOutQuad,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: context.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    padding: EdgeInsets.only(right: 15, left: 5),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Typicons.star_filled,
                            color: context.tertiary,
                          ),
                          Text(
                            ' ${widget.product.rating}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: context.tertiary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
