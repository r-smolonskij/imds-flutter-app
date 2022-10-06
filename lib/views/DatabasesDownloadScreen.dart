import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterTestApp/app_localizations.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/models/models.dart';
import 'package:path_provider/path_provider.dart';

// import '../objectbox.g.dart';

class DatabasesDownloadScreen extends StatefulWidget {
  @override
  _DatabasesDownloadScreenState createState() =>
      _DatabasesDownloadScreenState();
}

class _DatabasesDownloadScreenState extends State<DatabasesDownloadScreen> {
  int _selectedBottomNavbarIndex = 0;

  void _onNavigationTap(int index) {
    print(index);
    setState(() {
      _selectedBottomNavbarIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    // Text(
    //   'Index 0: Home',
    //   style: TextStyle(fontSize: 140),
    // ),
    LocalDBList(),
    AvailableDBList(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return DefaultView(
        title: "Offline Databases",
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: _widgetOptions.elementAt(_selectedBottomNavbarIndex),
              )
            ],
          ),
        ),
        bottomNavigationBar: _createBottomNavigationBar());
  }

  Widget _createBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(gradient: kDefaultLinearGradient),
      child: BottomNavigationBar(
        currentIndex: _selectedBottomNavbarIndex,
        onTap: _onNavigationTap,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.white,
        selectedFontSize: 18,
        unselectedFontSize: 18,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              "My Local Databases",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_sharp),
            title: Text(
              "Available Databases",
            ),
          ),
        ],
      ),
    );
  }
}

class LocalDBList extends StatelessWidget {
  const LocalDBList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "My Local Databases",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          LocalDBListItem(
            dbName: "Local DB",
          )
        ],
      ),
    );
  }
}

class LocalDBListItem extends StatelessWidget {
  const LocalDBListItem({Key key, this.dbName}) : super(key: key);
  final String dbName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green, width: 2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                "Local DB Local DB Local DB",
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Row(children: [
              GestureDetector(
                child: Icon(
                  Icons.update,
                  color: Colors.green,
                  size: 30,
                ),
              ),
              GestureDetector(
                child: Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.green,
                  size: 30,
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}

class AvailableDBList extends StatelessWidget {
  const AvailableDBList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = ["Suns", "Kakis"];
    return Container(
      child: Column(
        children: [
          Text(
            "Available Databases",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                // var title = list[index];
                padding:
                EdgeInsets.all(16.0);
                return ListTile(
                  title: Text("title"),
                );
              },
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}

class AvailableDBListItem extends StatelessWidget {
  const AvailableDBListItem({Key key, this.dbName}) : super(key: key);
  final String dbName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green, width: 2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                "Local DB Local DB Local DB",
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                    fontWeight: FontWeight.w600),
              ),
            ),
            GestureDetector(
              child: Icon(
                Icons.download_rounded,
                color: Colors.green,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
