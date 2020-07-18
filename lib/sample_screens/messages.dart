import 'package:design/constant/shared_color.dart';
import 'package:design/sample_json/json.dart';
import 'package:design/shared_widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            leading: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            title: Text("Messages",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            centerTitle: true,
            actions: <Widget>[
              Padding(
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
              )
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SearchBar(),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                    child: ListView.builder(
                        itemCount: SampleJSON.user.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            children: <Widget>[
                              index == 0
                                  ? Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            radius: 37,
                                            backgroundColor:
                                                SharedColor.blueAncent,
                                            child: CircleAvatar(
                                              radius: 35,
                                              backgroundColor: Colors.white,
                                              child: Icon(Icons.add,
                                                  color:
                                                      SharedColor.blueAncent),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            width: 80,
                                            child: Center(
                                              child: Text(
                                                SampleJSON.user[index]["name"],
                                                maxLines: 1,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ))
                                      ],
                                    )
                                  : Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            radius: 38,
                                            backgroundColor:
                                                SharedColor.blueAncent,
                                            child: CircleAvatar(
                                              radius: SampleJSON.user[index]
                                                          ["view"] ==
                                                      false
                                                  ? 35
                                                  : 38,
                                              backgroundImage: NetworkImage(
                                                  SampleJSON.user[index]
                                                      ["image"]),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            width: 50,
                                            child: Center(
                                              child: Text(
                                                SampleJSON.user[index]["name"],
                                                maxLines: 1,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ))
                                      ],
                                    ),
                            ],
                          );
                        }),
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
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(SampleJSON.messages[index]["name"]),
                            Text(SampleJSON.messages[index]["last_time"],
                                style: TextStyle(fontStyle: FontStyle.italic)),
                          ],
                        ),
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
