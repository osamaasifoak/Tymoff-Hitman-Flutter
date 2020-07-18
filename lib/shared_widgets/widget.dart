import 'package:flutter/material.dart';

class SharedWidget{
 static Widget simpleAppBar(title,context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey[200].withOpacity(0.2),
      leading: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      title: Text(title,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black)),
      centerTitle: true,
    );
  }
}