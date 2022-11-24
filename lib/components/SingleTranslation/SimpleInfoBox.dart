import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/SingleTranslation/PiktoIcon.dart';
import 'package:flutterTestApp/funtions.dart';
import 'package:flutterTestApp/sqlite/translation.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:collection/collection.dart';

class SimpleInfoBox extends StatelessWidget {
  const SimpleInfoBox({
    Key key,
    this.translation,
  }) : super(key: key);

  final Translation translation;

  @override
  Widget build(BuildContext context) {
    PlantGroup foundGroup = plantsGroups.firstWhere(
        (group) =>
            group.type == translation.plant_group &&
            group.subType == translation.plant_subgroup,
        orElse: () => null);

    return foundGroup != null
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                // gradient: kDefaultLinearGradient,
                color: Color(0xFFf0ec74),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.white),
              ),
              child: Row(
                children: [
                  Tooltip(
                      message: getTranslation(context, foundGroup.text),
                      child: PiktoIcon(
                        imagePath: foundGroup.imageName,
                      ))
                ],
              ),
            ),
          )
        : SizedBox();
  }
}
