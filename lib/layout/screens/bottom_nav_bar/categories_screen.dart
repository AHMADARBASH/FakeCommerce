import 'package:animate_do/animate_do.dart';
import 'package:fakecommerce/bloc/categories/categories_cubit.dart';
import 'package:fakecommerce/bloc/categories/categories_state.dart';
import 'package:fakecommerce/bloc/products/products_cubit.dart';
import 'package:fakecommerce/bloc/products/products_state.dart';
import 'package:fakecommerce/layout/widgets/category.dart';
import 'package:fakecommerce/layout/widgets/product.dart';
import 'package:fakecommerce/utilities/context_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../data/constants/categories.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    final productsCubit = BlocProvider.of<ProductsCubit>(context);
    productsCubit.getProductsInCategory(category: categories[_currentIndex]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Categories',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              child: BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) => StatefulBuilder(
                  builder: (context, newSetState) => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        if (state is ProductsLoadingState) {
                          return;
                        }
                        BlocProvider.of<ProductsCubit>(context)
                            .getProductsInCategory(
                          category: categories[index],
                        );
                        newSetState(
                          () {
                            _currentIndex = index;
                          },
                        );
                      },
                      child: CategoryWidget(
                          globalIndex: _currentIndex,
                          index: index,
                          title: categories[index]),
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, categorriesState) =>
                  BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) => state is ProductsLoadingState
                    ? SizedBox(
                        height: context.height * 0.7,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Expanded(
                        child: MasonryGridView.builder(
                          itemCount: state.products.length,
                          gridDelegate:
                              const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          padding: EdgeInsets.all(5),
                          itemBuilder: (context, index) => FadeInUp(
                            curve: Curves.easeOutCubic,
                            delay: Duration(milliseconds: 75 * index),
                            child: ProductWidget(
                              product: state.products[index],
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ));
  }
}
