import 'package:fakecommerce/bloc/cart/cart_state.dart';
import 'package:fakecommerce/data/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  List<Product> products = [];
  int get items => products.length;

  CartCubit() : super(CartInitState());

  void addProduct(Product product) {
    emit(CartLoadingState());
    products.add(product);
    emit(CartUpdateState(products: products));
  }

  void removeProduct(int id) {
    emit(CartLoadingState());
    products.removeWhere((e) => e.id == id);
    emit(CartUpdateState(products: products));
  }
}
