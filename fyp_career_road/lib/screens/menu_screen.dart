import 'package:fyp_career_road/components/bottomNavBar.dart';
import 'package:fyp_career_road/screens/login_screen.dart';
import 'package:fyp_career_road/services/authentication.dart';
import 'package:fyp_career_road/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              "Add USER NAME HERE",
              style: kTitleStyle,
            )),
          ),
          Visibility(
            // visible: isAdmin variable,
            visible: false,
            child: ListTile(
              leading: Icon(
                Icons.add,
                color: Colors.white,
              ),
              title: Text(
                "Add/Remove Career",
                style: kLabelStyle,
              ),
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
}
