import 'package:fakecommerce/data/models/product.dart';

abstract class ProductsState {
  List<Product> products = [];
  ProductsState({required this.products});
}

class ProductsInitState extends ProductsState {
  ProductsInitState({required super.products});
}

class ProductsUpdateState extends ProductsState {
  ProductsUpdateState({required super.products});
}

class ProductsLoadingState extends ProductsState {
  ProductsLoadingState() : super(products: []);
}

class ProductsErrorState extends ProductsState {
  String errorMessage;
  ProductsErrorState({required this.errorMessage}) : super(products: []);
}
