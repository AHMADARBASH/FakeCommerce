import 'package:fakecommerce/bloc/categories/categories_cubit.dart';
import 'package:fakecommerce/bloc/categories/categories_state.dart';
import 'package:fakecommerce/layout/widgets/category.dart';
import 'package:fakecommerce/utilities/context_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    if (!BlocProvider.of<CategoriesCubit>(context).isInit) {
      BlocProvider.of<CategoriesCubit>(context).getAllCategories();
    }
    super.initState();
  }

  int _currentIndex = 0;

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
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) => SizedBox(
                height: 60,
                child: StatefulBuilder(
                  builder: (context, newSetState) => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        newSetState(
                          () {
                            _currentIndex = index;
                          },
                        );
                      },
                      child: CategoryWidget(
                          globalIndex: _currentIndex,
                          index: index,
                          title: state.categories[index]),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
