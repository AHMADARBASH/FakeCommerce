import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:fakecommerce/bloc/cart/cart_cubit.dart';
import 'package:fakecommerce/bloc/cart/cart_state.dart';
import 'package:fakecommerce/utilities/context_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/CartScreen';
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cartBloc = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) => Column(children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) => Dismissible(
                      background: Container(
                        padding: EdgeInsets.only(right: 20),
                        color: context.errorColor,
                        child: Icon(
                          Icons.delete,
                          color: context.secondaryColor,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      confirmDismiss: (direction) async {
                        return await showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  surfaceTintColor: context.secondaryColor,
                                  content: Text(
                                    'Do you want to delete this item?',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      child: const Text('No'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: context.primaryColor,
                                        foregroundColor: context.secondaryColor,
                                      ),
                                      child: const Text('Yes'),
                                      onPressed: () async {
                                        cartBloc.removeProduct(
                                            state.products[index].product.id!);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ));
                      },
                      direction: DismissDirection.endToStart,
                      key: Key(state.products[index].product.id!.toString()),
                      child: FadeInUp(
                        curve: Curves.easeOutCubic,
                        delay: Duration(milliseconds: 50 * index),
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.secondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: context.width,
                          height: context.height * 0.1,
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Row(children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FadeInImage(
                                  placeholder: AssetImage(
                                      'assets/images/purple_logo.png'),
                                  image: NetworkImage(
                                      state.products[index].product.image!),
                                  fadeInDuration: Duration(seconds: 1),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.products[index].product.title!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 16),
                                    maxLines: 2,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        state.products[index].product.price!
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!,
                                      ),
                                      Text(
                                        ' \$',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFeatures: [
                                              FontFeature.enable('sups')
                                            ]),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(children: [
                                InkWell(
                                  onTap: () {
                                    cartBloc.increaseQty(
                                        state.products[index].product.id!);
                                  },
                                  child: Text('+'),
                                ),
                                Text(
                                  state.products[index].qty.toString(),
                                  style:
                                      Theme.of(context).textTheme.bodyMedium!,
                                ),
                                InkWell(
                                  onTap: () {
                                    cartBloc.decreaseQty(
                                        state.products[index].product.id!);
                                  },
                                  child: Text('-'),
                                ),
                              ]),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: context.width,
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: context.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Price: ${cartBloc.totalPrice}'),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: cartBloc.products.length == 0
                                ? Colors.grey
                                : context.primaryColor),
                        onPressed: () {},
                        child: Text(
                          'Confirm order',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: context.secondaryColor),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: context.height * 0.03,
                )
              ])),
    );
  }
}
