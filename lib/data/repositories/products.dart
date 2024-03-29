import 'package:fakecommerce/data/models/product.dart';
import 'package:fakecommerce/data/repositories/api.dart';

class ProductsReporsitory extends APIRepository {
  Future<List<Product>> getTopProducts() async {
    List<dynamic> data =
        await super.get(URL: 'https://fakestoreapi.com/products?limit=7');
    return data.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<Product>> getProductsInCategory(
      {required String category}) async {
    List<dynamic> data = await super
        .get(URL: 'https://fakestoreapi.com/products/category/$category');
    return data.map((e) => Product.fromJson(e)).toList();
  }
}
