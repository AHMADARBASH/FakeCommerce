import 'package:fakecommerce/utilities/exceptions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class APIRepository {
  Future<List<dynamic>> GET({required String URL}) async {
    final url = Uri.parse(URL);
    final response = await http.get(url).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        throw HTTPException(message: 'Time out');
      },
    );
    if (response.statusCode != 200) {
      throw HTTPException(message: 'Server Error');
    }
    return json.decode(response.body);
  }
}
