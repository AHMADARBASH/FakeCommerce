import 'package:fakecommerce/data/models/product.dart';

abstract class TopProductsState {
  List<Product> products = [];
  TopProductsState({required this.products});
}

class TopProductsInitState extends TopProductsState {
  TopProductsInitState({required super.products});
}

class TopProductsUpdateState extends TopProductsState {
  TopProductsUpdateState({required super.products});
}

class TopProductsLoadingState extends TopProductsState {
  TopProductsLoadingState() : super(products: []);
}

class TopProductsErrorState extends TopProductsState {
  String errorMessage;
  TopProductsErrorState({required this.errorMessage}) : super(products: []);
}
