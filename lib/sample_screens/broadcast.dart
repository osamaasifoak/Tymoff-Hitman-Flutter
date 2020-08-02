import 'package:flutter_svg/svg.dart';
import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/constant/shared_color.dart';
import 'package:tymoff/constant/shared_styles.dart';
import 'package:tymoff/sample_json/json.dart';
import 'package:tymoff/shared_widgets/search_bar.dart';
import 'package:tymoff/shared_widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BroadcastSettings extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          body: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0xffE4E4FF),
                        offset: Offset(1.0, 6.0),
                        blurRadius: 5.0,
                      ),
                      BoxShadow(
                        color: Color(0xffF5F4FF),
                        offset: Offset(1.0, 6.0),
                        blurRadius: 4.0,
                      ),
                    ],
                    gradient: LinearGradient(
                        colors: [
                          Color(0xffE4E4FF).withOpacity(0.10),
                          Color(0xffF5F4FF)
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(0.1, -1.0),
                        stops: [0.0, 10.0],
                        tileMode: TileMode.repeated),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(StringConstant.officeFriends,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      Container()
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20),
                  child: Text(StringConstant.broadcastSettings,
                      style: TextStyle(
                          fontSize: 18,
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
                            hintText: StringConstant.broadcastListName,
                            hintStyle: TextStyle(
                              fontSize: 15,
                            ),
                            suffixStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            suffixText: StringConstant.motivationTips,
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
                        '${SampleJSON.broadcastUser.length} ${StringConstant.members}',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        enableFeedback: true,
                        onTap: () {
                          scaffoldKey.currentState.showBottomSheet(
                              (context) => BottomSheetModalAddNew(),
                              backgroundColor:
                                  Colors.transparent.withOpacity(0.90),
                              elevation: 10.0);
                        },
                        child: Text(
                          StringConstant.addNewMembers,
                          maxLines: 1,
                          style:
                              TextStyle(fontSize: 16, color: Colors.blue[600]),
                        ),
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
                    itemCount: SampleJSON.broadcastUser.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                                SampleJSON.broadcastUser[index]["image"])),
                        title: Text(SampleJSON.broadcastUser[index]["name"],
                            style: TextStyle(fontSize: 15)),
                        trailing: Icon(
                          FontAwesomeIcons.ellipsisH,
                          size: 15,
                          color: Colors.grey.withOpacity(0.5),
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

class BottomSheetModalAddNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 80),
      child: Container(
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: new BoxDecoration(
                color: SharedColor.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(StringConstant.addMembers,
                  style: SharedStyles.bottomsheetHeading),
            ),
          ),
          SearchBar(),
          Flexible(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    );
                  },
                  itemCount: SampleJSON.user.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(SampleJSON.user[index]["image"])),
                      title: Text(SampleJSON.user[index]["name"],
                          style: TextStyle(fontSize: 18)),
                      trailing: Icon(FontAwesomeIcons.circle,
                          color: SharedColor.grey),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: SharedColor.blueAncent,
                          offset: Offset(1.0, 3.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: FlatButton(
                      color: SharedColor.blueAncent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(StringConstant.add,
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
