import 'package:fakecommerce/bloc/cart/cart_state.dart';
import 'package:fakecommerce/data/models/cart_item.dart';
import 'package:fakecommerce/data/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  List<CartItem> products = [];
  CartCubit() : super(CartInitState());
  int get items => products.length;
  double get totalPrice {
    double price = 0;
    products.forEach((element) {
      price += element.product.price! * element.qty;
    });
    return double.parse(price.toStringAsFixed(2));
  }

  bool isExist({required Product product}) {
    bool isExist = false;
    for (var e in products) {
      if (e.product.id == product.id) {
        isExist = true;
      }
    }
    return isExist;
  }

  void addProduct(CartItem item) {
    emit(CartLoadingState());
    products.add(item);
    emit(CartUpdateState(products: products));
  }

  void removeProduct(int id) {
    emit(CartLoadingState());
    products.removeWhere((e) => e.product.id == id);
    emit(CartUpdateState(products: products));
  }

  void increaseQty(int id) {
    for (var e in products) {
      if (e.product.id == id) {
        e.qty += 1;
      }
    }
    emit(CartUpdateState(products: products));
  }

  void decreaseQty(int id) {
    for (var e in products) {
      if (e.product.id == id) {
        if (e.qty == 1) {
          return;
        } else {
          e.qty -= 1;
        }
      }
    }
    emit(CartUpdateState(products: products));
  }
}
