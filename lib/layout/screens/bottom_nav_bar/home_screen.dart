import 'package:animate_do/animate_do.dart';
import 'package:fakecommerce/bloc/Auth/auth_cubit.dart';
import 'package:fakecommerce/bloc/favorites/favorites_cubit.dart';
import 'package:fakecommerce/bloc/topProducts/topProducts_cubit.dart';
import 'package:fakecommerce/bloc/topProducts/topProducts_state.dart';
import 'package:fakecommerce/layout/widgets/product.dart';
import 'package:fakecommerce/utilities/context_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttericon/octicons_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<AuthCubit>(context).updateAuthState();
    final topProductsCubit = BlocProvider.of<TopProductsCubit>(context);
    if (!topProductsCubit.isInit) {
      BlocProvider.of<TopProductsCubit>(context).getTopProducts();
    }
    BlocProvider.of<FavoritesCubit>(context).getFavorites();
    super.initState();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Octicons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Top Trending Products',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: context.height * 0.01,
            ),
            BlocBuilder<TopProductsCubit, TopProductsState>(
              builder: (context, state) => state is TopProductsLoadingState
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
                  : state is TopProductsErrorState
                      ? Text(state.errorMessage)
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
            )
          ],
        ),
      ),
    );
  }
}
