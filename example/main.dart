import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:landa_messenger_api/landa_messenger_api.dart';

void main() async {
  final api = LandaMessengerAPI();
  var response = await api.chat.send(
    id: 'a5f788615aa9cfea09a6b5f5c3e15b87cc55d4e908e4baef731e06522a998321',
    apiKey: 'a5f788615aa9cfea09a6b5f5c3e15b87cc55d4e908e4baef731e06522a998321',
    title: 'Test Dart Title',
    body: 'Test Dart body',
    url: 'https://github.com/landamessenger/landa-messenger-dart',
    image: 'https://avatars.githubusercontent.com/u/63705403?s=200&v=4',
    imageElevation: 3.0,
    backgroundColor: Colors.teal,
    textColor: Colors.white,
  );
  if (kDebugMode) {
    print(response.body);
  }
}
