import 'package:tymoff/sample_screens/broadcast.dart';
import 'package:tymoff/sample_screens/chat_settings.dart';
import 'package:tymoff/sample_screens/media.dart';
import 'package:tymoff/sample_screens/messages.dart';
import 'package:flutter/material.dart';

import 'constant/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
              textTheme: TextTheme(headline1: TextStyle(color: Colors.black)))),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case RoutesConstant.home:
            return MaterialPageRoute(builder: (_) => MyHomePage());
          case RoutesConstant.messages:
            return MaterialPageRoute(builder: (_) => Messages());
          case RoutesConstant.broadcastSetting:
            return MaterialPageRoute(builder: (_) => BroadcastSettings());
          case RoutesConstant.chatSetting:
            return MaterialPageRoute(builder: (_) => ChatSettings());
          case RoutesConstant.media:
            return MaterialPageRoute(builder: (_) => Media());
          default:
            return MaterialPageRoute(
                builder: (_) => Scaffold(
                      body: Center(
                          child: Text('No route defined for ${settings.name}')),
                    ));
        }
      },
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesConstant.home,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 2), () {
    //   Navigator.pushNamed(context, RoutesConstant.messages);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesConstant.messages);
                },
                child: Text("messages")),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesConstant.broadcastSetting);
                },
                child: Text("Broadcast settings")),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesConstant.media);
                },
                child: Text("Media")),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesConstant.chatSetting);
                },
                child: Text("chat settings"))
          ],
        ),
      ),
    );
  }
}
