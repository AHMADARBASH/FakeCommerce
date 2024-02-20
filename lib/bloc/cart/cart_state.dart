import 'package:fakecommerce/data/models/cart_item.dart';
import 'package:fakecommerce/data/models/product.dart';

abstract class CartState {
  List<CartItem> products = [];

  CartState({required this.products});
}

class CartInitState extends CartState {
  CartInitState() : super(products: []);
}

class CartErrorState extends CartState {
  final String errorMessage;
  CartErrorState({required this.errorMessage}) : super(products: []);
}

class CartLoadingState extends CartState {
  CartLoadingState() : super(products: []);
}

class CartUpdateState extends CartState {
  CartUpdateState({required super.products});
}
