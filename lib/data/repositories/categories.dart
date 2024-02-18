import 'package:fakecommerce/data/repositories/api.dart';

class CategoriesRepository extends APIRepository {
  Future<List<String>> getAllCategories() async {
    List<dynamic> data =
        await super.get(URL: 'https://fakestoreapi.com/products/categories');
    return data.map((e) => e.toString()).toList();
  }
}
