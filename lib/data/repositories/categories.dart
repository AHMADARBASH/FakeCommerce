import 'package:fakecommerce/data/repositories/api.dart';

class CategoriesRepositor extends APIRepository {
  Future<List<String>> getAllCategories() async {
    List<dynamic> data =
        await super.GET(URL: 'https://fakestoreapi.com/products/categories');
    return data.map((e) => e.toString()).toList();
  }
}
