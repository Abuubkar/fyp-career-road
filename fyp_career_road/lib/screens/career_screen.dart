import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_career_road/components/bottomNavBar.dart';
import 'package:fyp_career_road/models/career_entity.dart';
import 'package:fyp_career_road/models/constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:fyp_career_road/services/firestore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CareerScreen extends StatefulWidget {
  final CareerEntity career;

  const CareerScreen(this.career);

  @override
  _CareerScreenState createState() => _CareerScreenState();
}

class _CareerScreenState extends State<CareerScreen> {
  int _bottomNavIndex = 2;
  int _selectedIndex = 0;
  String careerData = "";
  String isHere = " ";
  IconData bookmarkIcon;

  @override
  void initState() {
    super.initState();
    careerData = widget.career.info;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.career.toJson());
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(widget.career.name),
        actions: <Widget>[
          FutureBuilder(
              future: Database.isBookmarkPresent(widget.career.name),
              builder: (context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error occurred: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else
                  bookmarkIcon = snapshot.data.isNotEmpty
                      ? Icons.bookmark
                      : Icons.bookmark_border;
                return IconButton(
                  icon: Icon(
                    bookmarkIcon,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    // do something
                    String id =
                        await Database.isBookmarkPresent(widget.career.name);
                    bool isPresent = id.isNotEmpty;
                    if (!isPresent) {
                      bool success = await Database.addBookmark(
                          widget.career.name,
                          widget.career.id,
                          FirebaseAuth.instance.currentUser.email);
                      print(success);
                      if (success) {
                        //do the hell you want cuz data has been added then navigate.
                        Alert(
                          context: context,
                          title: 'Notice',
                          // and display its name
                          desc: 'Bookmark Added',
                        ).show();

                        // CHANGE ICON
                        setState(() {
                          bookmarkIcon = Icons.bookmark;
                        });
                      } else {
                        //show error snackbar
                        Alert(
                                context: context,
                                title: 'Error',
                                // and display its name
                                desc: 'Bookmark cannot be added')
                            .show();
                      }
                    } else {
                      print('bookmark removed');
                      bookmarkIcon = Icons.bookmark_outline;
                      Database.removeBookmark(id).then((value) {
                        Alert(
                          context: context,
                          title: 'Notice',
                          // and display its name
                          desc: 'Bookmark Removed',
                        ).show();
                        // Changing bookmark icon
                        setState(() {
                          bookmarkIcon = Icons.bookmark_border;
                        });
                      });
                    }
                  },
                );
              })
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          GNav(
            haptic: true,
            tabs: [
              GButton(
                icon: Icons.alternate_email,
                text: 'Info',
                textStyle: kLabelStyle,
                iconColor: Colors.white,
                iconActiveColor: Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                    careerData = widget.career.info;
                  });
                },
              ),
              GButton(
                icon: Icons.map,
                text: 'Roadmap',
                textStyle: kLabelStyle,
                iconColor: Colors.white,
                iconActiveColor: Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                    careerData = widget.career.roadMap;
                  });
                },
              ),
              GButton(
                icon: Icons.forum,
                text: 'Links',
                textStyle: kLabelStyle,
                iconColor: Colors.white,
                iconActiveColor: Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                    careerData = widget.career.link;
                  });
                },
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Divider(
            thickness: 1,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
                child: Text(
              careerData,
              textAlign: TextAlign.center,
              style: kLabelStyle,
            )),
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(bottomNavIndex: _bottomNavIndex),
    );
  }
}
