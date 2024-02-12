import 'package:fakecommerce/bloc/categories/categories_cubit.dart';
import 'package:fakecommerce/bloc/nav_bar_index/index_cubit.dart';
import 'package:fakecommerce/bloc/products/products_cubit.dart';
import 'package:fakecommerce/layout/screens/shared/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import './utilities/routes.dart';
import './utilities/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FakeCommerce());
}

class FakeCommerce extends StatelessWidget {
  const FakeCommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MultiBlocProvider(
        providers: [
          BlocProvider<BottomNavBarCubit>(
            create: (_) => BottomNavBarCubit(),
          ),
          BlocProvider<ProductsCubit>(
            create: (_) => ProductsCubit(),
          ),
          BlocProvider<CategoriesCubit>(
            create: (_) => CategoriesCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
          onGenerateRoute: RouteGenerator.generatedRoute,
          theme: themes['whiteTheme'],
        ),
      ),
    );
  }
}
