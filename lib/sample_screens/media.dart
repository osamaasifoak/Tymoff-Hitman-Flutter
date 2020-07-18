import 'package:design/constant/constant.dart';
import 'package:design/sample_json/json.dart';
import 'package:design/shared_widgets/flat_buttons.dart';
import 'package:design/shared_widgets/widget.dart';
import 'package:flutter/material.dart';

class Media extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: SharedWidget.simpleAppBar(StringConstant.media, context),
          body: Padding(
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
                        SharedFlatButtons(btnText: "Photos"),
                        SharedFlatButtons(btnText: "Links"),
                        SharedFlatButtons(btnText: "Videos"),
                      ],
                    ),
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
                            image:
                                NetworkImage(SampleJSON.photos[index]["image"]),
                            fit: BoxFit.cover,
                          )),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
