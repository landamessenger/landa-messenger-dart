import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stack_trace/stack_trace.dart';

abstract class BaseApi {
  final exceptionContextError = 'Not valid context for url execution.';
  final implContextStr = 'Impl.';
  final implContextIndex = 2;
  final api = 'https://landamessenger.com/api';
  abstract String endpoint;

  Uri methodUrl() {
    String method;
    if (Trace
        .current()
        .frames
        .length < implContextIndex) {
      throw (exceptionContextError);
    } else if (Trace
        .current()
        .frames[implContextIndex].member == null) {
      throw (exceptionContextError);
    } else if (!Trace
        .current()
        .frames[implContextIndex]
        .member!
        .contains(implContextStr)) {
      method = Trace
          .current()
          .frames[implContextIndex]
          .member!;
    } else {
      method = Trace
          .current()
          .frames[implContextIndex]
          .member!
          .split(implContextStr)
          .last;
    }
    return Uri.parse(
      '$api/$endpoint/$method',
    );
  }

  Future<http.Response> execute(dynamic data,) =>
      http.post(
        methodUrl(),
        body: jsonEncode(data),
      );
}
