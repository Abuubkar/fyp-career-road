import 'package:flutter/material.dart';
import 'package:fyp_career_road/components/bottomNavBar.dart';
import 'package:fyp_career_road/models/career_entity.dart';
import 'package:fyp_career_road/screens/career_screen.dart';
import 'package:fyp_career_road/services/firestore.dart';
import 'package:fyp_career_road/models/constants.dart';

class CareerListScreen extends StatefulWidget {
  @override
  _CareerListScreenState createState() => _CareerListScreenState();
}

class _CareerListScreenState extends State<CareerListScreen> {
  @override
  Widget build(BuildContext context) {
    int _bottomNavIndex = 2;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Center(child: Text('Courses')),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: Database.getAllCareers(),
                builder: (context, AsyncSnapshot<List<CareerEntity>> snapshot) {
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
                        final CareerEntity career = snapshot.data[index];
                        return ListTile(
                            leading: Text((index + 1).toString(),
                                style: kLabelStyle),
                            title: Text(career.name),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CareerScreen(career)));
                            });
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
