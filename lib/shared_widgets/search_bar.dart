import 'package:flutter/material.dart';
import 'package:tymoff/constant/shared_color.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 15,
        child: Card(
          color: SharedColor.grey,
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              decoration: new InputDecoration(
                  // hintText: "Search",
                  hintStyle: TextStyle(
                    fontSize: 15,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  border: InputBorder.none),
            ),
          ),
        ),
      ),
    );
  }
}
