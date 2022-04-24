library landa_messenger_dart;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LandaMessengerDart {
  static LandaMessengerDart? _instance;

  final api = Uri.parse(
    'https://landamessenger.com/api/v1/integrations/sendBotMessage',
  );

  LandaMessengerDart._internal();

  factory LandaMessengerDart() {
    _instance ??= LandaMessengerDart._internal();
    return _instance!;
  }

  Future<http.Response> sendMessage({
    required String chatId,
    required String apiKey,
    required String title,
    required String body,
    String? url,
    String? image,
    double imageElevation = 0.0,
    Color? backgroundColor,
    Color? textColor,
  }) async {
    /**
     * Mandatory parameters
     */
    if (chatId.isEmpty) {
      throw Exception('not valid chatId');
    } else if (apiKey.isEmpty) {
      throw Exception('not valid apiKey');
    } else if (title.isEmpty) {
      throw Exception('not valid title');
    } else if (body.isEmpty) {
      throw Exception('not valid body');
    }

    /**
     * Optional parameters
     */
    if (url != null && url.isEmpty) {
      throw Exception('not valid url');
    } else if (image != null && image.isEmpty) {
      throw Exception('not valid url');
    }

    backgroundColor ??= Colors.teal;
    var bgColor = '#${backgroundColor.value.toRadixString(16).substring(2, 8)}';

    textColor ??= Colors.white;
    var tColor = '#${textColor.value.toRadixString(16).substring(2, 8)}';

    var response = await http.post(
      api,
      body: jsonEncode({
        'chat_id': chatId,
        'api_key': apiKey,
        'title': title,
        'body': body,
        'url': url,
        'image': image,
        'image_elevation': imageElevation,
        'background_color': bgColor,
        'text_color': tColor,
      }),
    );

    return response;
  }
}
