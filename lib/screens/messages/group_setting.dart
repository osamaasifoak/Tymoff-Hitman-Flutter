import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/constant/shared_color.dart';
import 'package:tymoff/sample_json/json.dart';
import 'package:tymoff/shared_widgets/flat_buttons.dart';
import 'package:flutter/material.dart';

class GroupSetting extends StatefulWidget {
  @override
  _GroupSettingState createState() => _GroupSettingState();
}

class _GroupSettingState extends State<GroupSetting> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    height: 100, color: SharedColor.grey.withOpacity(0.3)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back,
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                  "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg"),
                              child: Container(
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            ),
                            Icon(Icons.camera_alt, color: Colors.white),
                          ],
                        ),
                        Container()
                      ]),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Text(StringConstant.groupSettings,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                StringConstant.groupName,
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              Text(
                                "College gang",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  StringConstant.openToPublic,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                      print(isSwitched);
                                    });
                                  },
                                  activeTrackColor: SharedColor.blueAncent,
                                )
                              ],
                            ),
                            Text(
                              "This is the public link for the group. Anyone with this link can join the group and view/post content.",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                        Divider(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  StringConstant.postByAdminOnly,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                      print(isSwitched);
                                    });
                                  },
                                  activeTrackColor: SharedColor.blueAncent,
                                )
                              ],
                            ),
                            Text(
                              "Only admins can post in this group.",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.grey[50],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SharedFlatButtons(btnText: StringConstant.photos),
                          SharedFlatButtons(btnText: StringConstant.links),
                          SharedFlatButtons(btnText: StringConstant.videos),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15),
                      child: Text(StringConstant.media,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    Flexible(
                      child: GridView.builder(
                        itemCount: SampleJSON.photos.length,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Card(
                            child: ClipRRect(
                                child: Image(
                              image: NetworkImage(
                                  SampleJSON.photos[index]["image"]),
                              fit: BoxFit.cover,
                            )),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
