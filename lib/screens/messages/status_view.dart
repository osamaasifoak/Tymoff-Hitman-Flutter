import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:popup_menu/popup_menu.dart';
import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/constant/shared_color.dart';

class Status extends StatefulWidget {
  final user;
  const Status({Key key, this.user}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  GlobalKey actionOnStatusIcon = GlobalKey();
  @override
  Widget build(BuildContext context) {
    PopupMenu.context = context;
    PopupMenu menu = PopupMenu(
        backgroundColor: Colors.white,
        lineColor: Colors.white,
        maxColumn: 2,
        items: [
          MenuItem(
              image: Icon(
            Icons.warning,
            color: Colors.grey,
          )),
          MenuItem(
            title: StringConstant.reportStatus,
            textStyle: TextStyle(fontSize: 15.0, color: Colors.redAccent),
          ),
        ],
        onClickMenu: (MenuItemProvider item) {
          if (item.menuTitle == StringConstant.reportStatus) {
            bottomSheetReportStatus(context);
          }
        });

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: new BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"))),
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  enableFeedback: true,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  ),
                  title: Text(
                    "Osama",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: InkWell(
                      key: actionOnStatusIcon,
                      enableFeedback: true,
                      onTap: () {
                        menu.show(widgetKey: actionOnStatusIcon);
                      },
                      child: Icon(FontAwesomeIcons.ellipsisH,
                          color: Colors.white)),
                ),
              ],
            ),
          )),
    );
  }

  bottomSheetReportStatus(context) {
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
                    StringConstant.reportStatus,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  padding: EdgeInsets.all(15.0),
                ),
                Divider(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    StringConstant.nudityOrIllegalSubstances,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Divider(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    StringConstant.threatOrViolence,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Divider(),
                InkWell(
                  onTap: () {
                    bottomSheetReportOther(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      StringConstant.other,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    padding: EdgeInsets.all(10.0),
                  ),
                ),
                Divider(),
              ],
            ),
          );
        });
  }

  bottomSheetReportOther(context) {
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
                Row(
                  children: <Widget>[
                    InkWell(
                      enableFeedback: true,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        StringConstant.reportStatus,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      padding: EdgeInsets.all(15.0),
                    ),
                  ],
                ),
                Divider(),
                Container(
                  child: Text(
                    StringConstant.whyReportStatus,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.grey[200],
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          decoration: new InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: SharedColor.blueAncent,
                        onPressed: () {
                          bottomSheetReportedStatus(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(StringConstant.report,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  bottomSheetReportedStatus(context) {
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
                    StringConstant.statusHasBeenReported,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  padding: EdgeInsets.all(15.0),
                ),
                Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      "we recieved your report aaaaajhjasdas  hdgaysgdgashdgaskdh  asdhasdjkas   asjdfjasbdjasbdj",
                      style: TextStyle(fontSize: 15),
                    ),
                    padding: EdgeInsets.all(15.0),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: SharedColor.blueAncent,
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(StringConstant.blockedUser,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
