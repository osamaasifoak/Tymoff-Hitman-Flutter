import 'package:flutter/material.dart';
import 'constant/constant.dart';
import 'main.dart';
import 'sample_screens/broadcast.dart';
import 'sample_screens/media.dart';
import 'screens/messages/chat.dart';
import 'screens/messages/messages.dart';
import 'screens/messages/chat_settings.dart';

ongenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case RoutesConstant.home:
      return MaterialPageRoute(builder: (_) => MyHomePage());
    case RoutesConstant.messages:
      return MaterialPageRoute(builder: (_) => Messages());
    case RoutesConstant.broadcastSetting:
      return MaterialPageRoute(builder: (_) => BroadcastSettings());
    case RoutesConstant.chatSetting:
      return MaterialPageRoute(builder: (_) => ChatSettings());
    case RoutesConstant.chat:
      return MaterialPageRoute(builder: (_) => Chat());
    case RoutesConstant.media:
      return MaterialPageRoute(builder: (_) => Media());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
