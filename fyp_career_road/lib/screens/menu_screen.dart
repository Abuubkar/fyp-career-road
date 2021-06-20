import 'package:fyp_career_road/components/bottomNavBar.dart';
import 'package:fyp_career_road/screens/edit_career_screen.dart';
import 'package:fyp_career_road/screens/login_screen.dart';
import 'package:fyp_career_road/services/authentication.dart';
import 'package:fyp_career_road/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _bottomNavIndex = 4;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Menu')),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            color: Colors.black12,
            child: Center(
                child: Text(
              FirebaseAuth.instance.currentUser?.displayName ?? "not found",
              style: kTitleStyle,
            )),
          ),
          Visibility(
            visible: isAdmin(),
            child: ListTile(
              leading: Icon(
                Icons.add,
                color: Colors.white,
              ),
              title: Text(
                "Add/Remove Career",
                style: kLabelStyle,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditCareerScreen()));
              },
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: Text("Logout", style: kLabelStyle),
            onTap: () {
              context.read<AuthenticationService>().logOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(bottomNavIndex: _bottomNavIndex),
    );
  }

  bool isAdmin() {
    return FirebaseAuth.instance.currentUser.email.startsWith('_')
        ? true
        : false;
  }
}
