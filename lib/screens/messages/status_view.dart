import 'package:flutter/material.dart';
import 'package:tymoff/shared_widgets/simple_app_bar.dart';

class Status extends StatelessWidget {
  final user;
  const Status({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: SharedWidget.simpleAppBar(
          "", context, Icons.arrow_back, Colors.transparent),
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: new BoxDecoration(
            color: Colors.black,
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"))),
          child: Column(
            children: <Widget>[
              
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  ),
                  title: Text(
                    "Osama",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
