import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:landa_messenger_dart/landa_messenger_dart.dart';

void main() {
  test('Create a Landa Messenger message', () async {
    var response = await LandaMessengerDart().sendMessage(
      chatId:
          '6defec5ad5a3f7955788eaceaae617c81c54a24be135724cc708af4a168356ae',
      apiKey:
          'b1209566c845136b70a12db9b562f0a6658e3bb9814302a23a73ef2be463cbea',
      title: 'Test Dart Title',
      body: 'Test Dart body',
      url: 'https://github.com/landamessenger/landa-messenger-dart',
      image: 'https://avatars.githubusercontent.com/u/63705403?s=200&v=4',
      imageElevation: 3.0,
      backgroundColor: Colors.teal,
      textColor: Colors.white,
    );
    expect(response.statusCode, 200);
    if (kDebugMode) {
      print(response.body);
    }
  });
}
