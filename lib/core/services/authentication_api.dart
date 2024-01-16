import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class AuthenticationAPI {
  Future<int> signInAPI(
    String iDController,
    String password,
  ) async {
    String url = 'https://reqres.in/api/users?page=2';
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode({
        'iDController': iDController,
        'password': password,
      }),
    );

    return response.statusCode;
  }
}
