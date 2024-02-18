import 'package:fakecommerce/data/repositories/api.dart';

class AuthRepository extends APIRepository {
  Future<Map<String, dynamic>> login({Map<String, dynamic>? body}) async {
    final request = await super
        .post(URL: 'https://fakestoreapi.com/auth/login', body: body);
    return request;
  }
}
