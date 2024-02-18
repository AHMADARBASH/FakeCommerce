import 'package:fakecommerce/utilities/exceptions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class APIRepository {
  Future<List<dynamic>> get({required String URL}) async {
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

  Future<dynamic> post(
      {required String URL, Map<String, dynamic>? body}) async {
    final headers = {
      "Accept": "application/json",
      "content-type": "application/json"
    };
    final url = Uri.parse(URL);
    print(URL);
    final response =
        await http.post(url, body: json.encode(body), headers: headers).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        throw HTTPException(message: 'Time out');
      },
    );
    if (response.statusCode != 200) {
      throw HTTPException(message: 'Server Error');
    }
    print('post output ${json.decode(response.body)}');
    return json.decode(response.body);
  }
}
