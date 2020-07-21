import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tymoff/constant/constant.dart';
import '../../constant/shared_color.dart';
import '../../sample_json/json.dart';
import '../../shared_widgets/search_bar.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("Oisee",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black)),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesConstant.groupSetting);
            },
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.settings,
                    color: Colors.grey,
                    size: 20,
                  ),
                )),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SearchBar(),
            Expanded(
              child: ListView.builder(
                  itemCount: SampleJSON.chat.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        SampleJSON.chat[index]["sent"] == "from"
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  chatContainer(
                                      context,
                                      SampleJSON.chat[index]["message"],
                                      SampleJSON.chat[index]["media"],
                                      SharedColor.blueAncent.withOpacity(0.3)),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        SampleJSON.chat[index]["image"]),
                                  ),
                                ],
                              )
                            : Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        SampleJSON.chat[index]["image"]),
                                  ),
                                  chatContainer(
                                      context,
                                      SampleJSON.chat[index]["message"],
                                      SampleJSON.chat[index]["media"],
                                      SharedColor.grey),
                                ],
                              )
                      ],
                    );
                  }),
            ),
            inputTextFieldChat(context),
          ],
        ),
      ),
    );
  }

  Widget chatContainer(context, String text, String media, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        decoration: new BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: media == "" ? Text('$text') : chatWithMedia(media, text),
        ),
      ),
    );
  }

  Widget chatWithMedia(String media, String text) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(media),
            ),
          ),
          Text('$text', style: TextStyle(color: Colors.black87)),
        ]);
  }

  Widget inputTextFieldChat(context) {
    return Container(
      decoration:
          new BoxDecoration(border: Border(top: BorderSide(width: 0.5))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          InkWell(
            onTap: () {
              bottomSheetAttachment(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.attach_file, color: Colors.white),
                  )),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                decoration: new InputDecoration(
                    hintText: "Type a new message.",
                    hintStyle: TextStyle(
                      fontSize: 15,
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 14,
                  decoration: new BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.lightBlueAccent, blurRadius: 3.0)
                    ],
                    color: Colors.lightBlueAccent,
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.circular(50)
                  ),
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
        ],
      ),
    );
  }

  bottomSheetAttachment(context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        builder: (builder) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    StringConstant.sendaFile,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  padding: EdgeInsets.all(15.0),
                ),
                Divider(),
                Container(
                  child: Text(
                    StringConstant.clickaPhoto,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Divider(),
                Container(
                  child: Text(
                    StringConstant.uploadFromGallery,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Divider(),
                Container(
                  child: Text(
                    StringConstant.document,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Divider(),
                Container(
                  child: Text(
                    StringConstant.location,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Divider(),
                Container(
                  child: Text(
                    StringConstant.contact,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Divider(),
              ],
            ),
          );
        });
  }
}
