import 'package:fakecommerce/data/models/product.dart';
import 'package:fakecommerce/data/repositories/api.dart';

class ProductsReporsitory extends APIRepository {
  Future<List<Product>> getTopProducts() async {
    List<dynamic> data =
        await super.GET(URL: 'https://fakestoreapi.com/products?limit=7');
    return data.map((e) => Product.fromJson(e)).toList();
  }
}
