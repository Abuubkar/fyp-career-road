import 'package:flutter/material.dart';
import 'package:fyp_career_road/components/bottomNavBar.dart';
import 'package:fyp_career_road/models/bookmark_entity.dart';
import 'package:fyp_career_road/models/career_entity.dart';
import 'package:fyp_career_road/screens/career_screen.dart';
import 'package:fyp_career_road/services/firestore.dart';
import 'package:fyp_career_road/utilities/constants.dart';

import '../utilities/constants.dart';

class BookmarkScreen extends StatefulWidget {
  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    int _bottomNavIndex = 3;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Center(child: Text('Bookmarks')),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: Database.getBookmarksByEmail(),
                builder:
                    (context, AsyncSnapshot<List<BookmarkEntity>> snapshot) {
                  if (snapshot.hasError)
                    return Center(
                      child: Text('Error occurred: ${snapshot.error}'),
                    );
                  else if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  else
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        final BookmarkEntity bookmark = snapshot.data[index];
                        return ListTile(
                          onTap: () async {
                            CareerEntity career =
                                await Database.getCareerById(bookmark.careerId);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CareerScreen(career)));
                          },
                          leading:
                              Text((index + 1).toString(), style: kLabelStyle),
                          title: Text(bookmark.careerName),
                          trailing: InkWell(
                              onTap: () => Database.removeBookmark(bookmark.id)
                                      .then((value) {
                                    print(value);
                                    setState(() {});
                                  }),
                              child: Icon(Icons.delete, color: Colors.white)),
                        );
                      },
                    );
                }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(bottomNavIndex: _bottomNavIndex),
    );
  }
}
