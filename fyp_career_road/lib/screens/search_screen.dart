import 'package:flutter/material.dart';
import 'package:fyp_career_road/components/bottomNavBar.dart';
import 'package:fyp_career_road/models/career_entity.dart';
import 'package:fyp_career_road/screens/career_screen.dart';
import 'package:fyp_career_road/models/constants.dart';

class SearchScreen extends StatefulWidget {
  final List<CareerEntity> careers;

  const SearchScreen(this.careers);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Center(child: Text('Search Results')),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.careers.length,
              itemBuilder: (context, index) {
                final CareerEntity career = widget.careers[index];
                return ListTile(
                  leading: Text((index + 1).toString(), style: kLabelStyle),
                  title: Text(career.name),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CareerScreen(career)));
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
