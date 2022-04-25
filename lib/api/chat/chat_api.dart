import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:landa_messenger_api/api/base_api.dart';

abstract class ChatApi extends BaseApi {
  @override
  String endpoint = 'chat';

  Future<Response> send({
    required String chatId,
    required String apiKey,
    required String title,
    required String body,
    String? url,
    String? image,
    double imageElevation = 0.0,
    Color? backgroundColor,
    Color? textColor,
  });
}
