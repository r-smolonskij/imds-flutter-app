import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/LanguageChooseModal.dart';
import 'package:flutterTestApp/constants.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key key, this.goBack}) : super(key: key);
  final bool goBack;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: kDefaultLinearGradient),
      ),
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: Icon(
              goBack == true ? Icons.arrow_back : Icons.widgets,
              size: MediaQuery.of(context).size.height > 400
                  ? MediaQuery.of(context).size.height * 0.035
                  : 32,
            ),
            onPressed: () {
              goBack == true
                  ? Navigator.pop(context)
                  : Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      actions: [
        Builder(
          builder: (context) {
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    return showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return LanguageChooseModal();
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                    child: Icon(
                      Icons.language,
                      size: MediaQuery.of(context).size.height > 400
                          ? MediaQuery.of(context).size.height * 0.040
                          : 36,
                    ),
                  ),
                )
              ],
            );
          },
        )
      ],
    );
  }
}
