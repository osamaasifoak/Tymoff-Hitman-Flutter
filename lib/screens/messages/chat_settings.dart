import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/constant/shared_color.dart';
import 'package:tymoff/sample_json/json.dart';
import 'package:tymoff/shared_widgets/flat_buttons.dart';
import 'package:tymoff/shared_widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';

class ChatSettings extends StatefulWidget {
  @override
  _ChatSettingsState createState() => _ChatSettingsState();
}

class _ChatSettingsState extends State<ChatSettings> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: SharedWidget.simpleAppBar("Hitman", context, Icons.arrow_back,
              Colors.grey[200].withOpacity(0.2)),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                        "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Text(StringConstant.chatSettings,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              StringConstant.notifications,
                              style: TextStyle(fontSize: 18),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15),
                          child: Text(StringConstant.media,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
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
                        Column(
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height / 2,
                              color: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 5),
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
                            Container(
                              color: Colors.white,
                              alignment: Alignment.bottomRight,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5.0),
                              child: Text(
                                "View all",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.blue[800]),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: SharedColor.redBtnColor,
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(StringConstant.report + " Hitman",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: SharedColor.redBtnColor,
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Block Hitman",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                            ),
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

  Widget warningButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: SharedColor.redBtnColor,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(StringConstant.reportSpam,
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: SharedColor.redBtnColor,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(StringConstant.blockUser,
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
