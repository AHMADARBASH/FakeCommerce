import 'package:fakecommerce/data/models/product.dart';

class CartItem {
  Product product;
  int qty;
  CartItem({required this.product, required this.qty});
}
