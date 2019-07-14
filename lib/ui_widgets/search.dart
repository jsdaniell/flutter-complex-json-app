import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchWidget extends StatelessWidget {
  final performSearch;

  // Above is a common constructor to performSeach variable, can be created automatic on IntelliJ IDEA.

  const SearchWidget({Key key, @required this.performSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.search,
                color: Colors.black54,
              ),
              onTap: () {
                // To implement the search with TextField text have to make a TextController.
              },
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Search..."),
                onSubmitted: (String place) {
                  performSearch(place);
                },
              ),
            ),
            InkWell(
              onTap: () {},
              child: Icon(FontAwesomeIcons.slidersH, color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
