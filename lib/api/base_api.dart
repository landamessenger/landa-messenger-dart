import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class BaseApi {
  final api = 'https://landamessenger.com/api';
  abstract String endpoint;

  Future<http.Response> execute(
    String method,
    dynamic data,
  ) =>
      http.post(
        Uri.parse(
          '$api/$endpoint/$method',
        ),
        body: jsonEncode(data),
      );
}
