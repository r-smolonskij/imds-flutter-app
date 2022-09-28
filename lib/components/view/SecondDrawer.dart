import 'package:flutter/material.dart';
import 'package:flutterTestApp/views/SearchScreen.dart';
import 'package:flutterTestApp/views/TestScreen.dart';

class SecondDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Header")]),
            decoration: BoxDecoration(color: Colors.red),
          ),
          CustomListTile(
            title: "Test Screen",
            navigateTo: TestScreen(),
          ),
          CustomListTile(
            title: "Search Screen",
            navigateTo: SearchScreen(),
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key key,
    this.title,
    this.navigateTo,
  }) : super(key: key);
  final String title;
  final Widget navigateTo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateTo != null
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => navigateTo,
              ),
            )
          : print(title),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(
                Icons.home,
                size: 20,
              ),
            ),
            Flexible(
              child: Text(
                title != null ? title : "",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
