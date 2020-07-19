import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/sample_json/json.dart';
import 'package:tymoff/screens/messages/message_list.dart';
import 'package:tymoff/screens/messages/status_list.dart';
import 'package:tymoff/shared_widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'new_message.dart';
import 'noMessageInstruction.dart';

class Messages extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          elevation: 0.0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          title: Text(StringConstant.messages,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          centerTitle: true,
          actions: <Widget>[
            InkWell(
              onTap: () {
                scaffoldKey.currentState
                    .showBottomSheet((context) => BottomSheetModalNewMessage());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Container(
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.lightBlueAccent, blurRadius: 3.0)
                          ],
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          FontAwesomeIcons.paperPlane,
                          color: Colors.white,
                          size: 20,
                        ),
                      )),
                ),
              ),
            )
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SearchBar(),
                SampleJSON.messages.length != 0
                    ? StatusList(
                        status: SampleJSON.user,
                      )
                    : Container(),
                SampleJSON.messages.length != 0
                    ? MessageList(messages: SampleJSON.messages)
                    : NoMessage(
                        scaffoldKey: scaffoldKey,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
