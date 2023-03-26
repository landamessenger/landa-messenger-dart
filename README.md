# landa-messenger-dart

Landa Messenger Dart API for sending messages to chats.

Check the documentation in [Landa Messenger - API](https://landamessenger.com/api).

```dart
import 'package:flutter/material.dart';
import 'package:landa_messenger_api/landa_messenger_api.dart';

void main() async {
  final api = LandaMessengerAPI();
  var response = await api.chat.send(
    id: '6defec5ad5a3f7955788eaceaae617c81c54a24be135724cc708af4a168356ae',
    apiKey: 'b1209566c845136b70a12db9b562f0a6658e3bb9814302a23a73ef2be463cbea',
    title: 'Test Dart Title',
    body: 'Test Dart body',
    url: 'https://github.com/landamessenger/landa-messenger-dart',
    image: 'https://avatars.githubusercontent.com/u/63705403?s=200&v=4',
    imageElevation: 3.0,
    backgroundColor: Colors.teal,
    textColor: Colors.white,
  );
  print(response.body);
}
```

Success response:

```json
{
  "response": {
    "message_id": "bdcd418cd984aa552586d7394009cb5aa44a543218643063f63a5b158ac63c78",
    "response": "work_done"
  }
}
```