import 'package:flutter/material.dart';
import 'package:flutterTestApp/app_localizations.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/funtions.dart';
import 'package:flutterTestApp/views/AboutAppScreen.dart';
import 'package:flutterTestApp/views/DatabasesDownloadScreen.dart';
import 'package:flutterTestApp/views/Games/GamesListScreen.dart';

import 'package:flutterTestApp/views/InteractivePhotos/InteractivePhotosListScreen.dart';
import 'package:flutterTestApp/views/PublicationsScreen.dart';
import 'package:flutterTestApp/views/SearchByFiltersScreen.dart';
import 'package:flutterTestApp/views/SearchScreen.dart';
import 'package:flutterTestApp/views/TipsScreen.dart';
import 'package:flutterTestApp/views/UsedSourcesScreen.dart';
import 'package:flutterTestApp/views/UsedSymbolsScreen.dart';

class DefaultDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Header")]),
            decoration: BoxDecoration(
              color: Colors.blue,
              gradient: kDefaultLinearGradient,
            ),
          ),
          CustomListTile(
            title: getTranslation(context, "search"),
            iconName: Icons.search,
            navigateTo: SearchScreen(),
          ),
          CustomListTile(
            title: getTranslation(context, "search_by_filters"),
            iconName: Icons.person_search_outlined,
            navigateTo: SearchByFiltersScreen(),
          ),
          CustomListTile(
            title: getTranslation(context, "educational_games"),
            iconName: Icons.videogame_asset,
            navigateTo: GamesList(),
          ),
          CustomListTile(
            title: getTranslation(context, "tips"),
            iconName: Icons.model_training,
            navigateTo: TipsScreen(),
          ),
          CustomListTile(
            title:
                AppLocalizations.of(context).translate("about_jbv").toString(),
            iconName: Icons.info,
            navigateTo: AbboutAppScreen(),
          ),
          CustomListTile(
            title: AppLocalizations.of(context)
                .translate("used_symbols")
                .toString(),
            iconName: Icons.translate,
            navigateTo: UsedSymbolsScreen(),
          ),
          CustomListTile(
            title: AppLocalizations.of(context)
                .translate("used_sources")
                .toString(),
            iconName: Icons.source_outlined,
            navigateTo: UsedSourcesScreen(),
          ),
          CustomListTile(
            title: getTranslation(context, "photos"),
            iconName: Icons.photo,
            navigateTo: InteractivePhotosListScreen(),
          ),
          CustomListTile(
            title: AppLocalizations.of(context)
                .translate("publications")
                .toString(),
            iconName: Icons.group,
            navigateTo: PublicationsScreen(),
          ),
          CustomListTile(
            title: "My Local Databases",
            iconName: Icons.group,
            navigateTo: DatabasesDownloadScreen(),
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
    this.iconName,
    this.navigateTo,
  }) : super(key: key);
  final String title;
  final IconData iconName;
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
            bottom: BorderSide(color: Colors.grey[400], width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Icon(
                iconName != null ? iconName : Icons.home,
                size: MediaQuery.of(context).size.height > 400
                    ? MediaQuery.of(context).size.height * 0.04
                    : 32,
                color: Colors.black87,
              ),
            ),
            Flexible(
              child: Text(
                title != null ? title : "",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height > 400
                      ? MediaQuery.of(context).size.height * 0.018
                      : 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
