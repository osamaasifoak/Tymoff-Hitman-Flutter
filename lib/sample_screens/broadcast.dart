import 'package:design/constant/constant.dart';
import 'package:design/sample_json/json.dart';
import 'package:design/shared_widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BroadcastSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar:
              SharedWidget.simpleAppBar(StringConstant.officeFriends, context),
          body: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Text("Broadcast settings",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        decoration: new InputDecoration(
                            hintText: "Broadcast list name",
                            hintStyle: TextStyle(
                              fontSize: 15,
                            ),
                            suffixStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            suffixText: "Motivation tips",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${SampleJSON.user.length} Members',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Add new member",
                        maxLines: 1,
                        style: TextStyle(fontSize: 18, color: Colors.blue[600]),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Divider(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      );
                    },
                    itemCount: SampleJSON.messages.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(SampleJSON.user[index]["image"])),
                        title: Text(SampleJSON.messages[index]["name"],
                            style: TextStyle(fontSize: 18)),
                        trailing: Icon(FontAwesomeIcons.ellipsisH),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
