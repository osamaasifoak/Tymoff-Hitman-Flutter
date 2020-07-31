import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/constant/shared_color.dart';
import 'package:tymoff/sample_json/json.dart';
import 'package:tymoff/shared_widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BroadcastSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, kToolbarHeight),
            child: Container(
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
              child: SharedWidget.simpleAppBar(StringConstant.officeFriends,
                  context, Icons.arrow_back, Colors.grey[200].withOpacity(0.2)),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                        '${SampleJSON.user.length} ${StringConstant.members}',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        StringConstant.addNewMembers,
                        maxLines: 1,
                        style: TextStyle(fontSize: 16, color: Colors.blue[600]),
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
                            radius: 20,
                            backgroundImage:
                                NetworkImage(SampleJSON.user[index]["image"])),
                        title: Text(SampleJSON.messages[index]["name"],
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
