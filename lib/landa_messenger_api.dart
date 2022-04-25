library landa_messenger_api;

import 'package:landa_messenger_api/api/chat/chat_impl.dart';

class LandaMessengerAPI {
  static LandaMessengerAPI? _instance;

  final chat = ChatImpl();

  LandaMessengerAPI._internal();

  factory LandaMessengerAPI() {
    _instance ??= LandaMessengerAPI._internal();
    return _instance!;
  }
}
