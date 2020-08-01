import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tymoff/constant/shared_color.dart';
import 'package:tymoff/provider/search_provider.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchController = new TextEditingController();
  String searchingFilter;
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
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
                controller: _searchController,
                decoration: new InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 15,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    border: InputBorder.none),
                onTap: () {
                  setState(() {
                    _searchController.addListener(() {
                      setState(() {
                        searchProvider.searchString(_searchController.text);
                      });
                    });
                  });
                }),
          ),
        ),
      ),
    );
  }
}
