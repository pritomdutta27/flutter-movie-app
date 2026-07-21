import 'dart:convert';

import 'package:http/http.dart';

import 'ApiConstants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path) async {
    final response = await _client.get(
      Uri.parse('${ApiConstants.BASE_URL}$path'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${ApiConstants.API_KEY}',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return Exception(response.reasonPhrase);
    }
  }
}
