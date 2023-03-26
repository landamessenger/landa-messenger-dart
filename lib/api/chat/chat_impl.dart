import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'chat_api.dart';

class ChatImpl extends ChatApi {
  static ChatImpl? _instance;

  ChatImpl._internal();

  factory ChatImpl() {
    _instance ??= ChatImpl._internal();
    return _instance!;
  }

  @override
  Future<http.Response> send({
    required String id,
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
    if (id.isEmpty) {
      throw ('not valid id');
    } else if (apiKey.isEmpty) {
      throw ('not valid apiKey');
    } else if (title.isEmpty) {
      throw ('not valid title');
    } else if (body.isEmpty) {
      throw ('not valid body');
    }

    /**
     * Optional parameters
     */
    if (url != null && url.isEmpty) {
      throw ('not valid url');
    } else if (image != null && image.isEmpty) {
      throw ('not valid url');
    }

    backgroundColor ??= Colors.teal;
    var bgColor = '#${backgroundColor.value.toRadixString(16).substring(2, 8)}';

    textColor ??= Colors.white;
    var tColor = '#${textColor.value.toRadixString(16).substring(2, 8)}';

    return execute('send', <String, dynamic>{
      'id': id,
      'api_key': apiKey,
      'title': title,
      'body': body,
      'url': url,
      'image': image,
      'image_elevation': imageElevation,
      'background_color': bgColor,
      'text_color': tColor,
    });
  }
}
