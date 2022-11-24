import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterTestApp/components/LanguageChooseModal.dart';
import 'package:flutterTestApp/components/view/DefaultDrawer.dart';
import 'package:flutterTestApp/components/view/SecondDrawer.dart';
import 'package:flutterTestApp/constants.dart';

class DefaultView extends StatefulWidget {
  const DefaultView(
      {Key key,
      this.title,
      this.child,
      this.bottomNavigationBar,
      this.goBack,
      this.backgroundColor,
      this.haveLandscapeMode})
      : super(key: key);

  final String title;
  final Widget child;
  final Widget bottomNavigationBar;
  final bool goBack, haveLandscapeMode;
  final Color backgroundColor;

  @override
  _DefaultViewState createState() => _DefaultViewState();
}

class _DefaultViewState extends State<DefaultView> {
  hideKeyboard() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  void initState() {
    super.initState();
    if (widget.haveLandscapeMode != null && widget.haveLandscapeMode) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Container(
        decoration: BoxDecoration(
          gradient: kDefaultLinearGradient,
        ),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              flexibleSpace: Container(
                decoration: BoxDecoration(gradient: kDefaultLinearGradient),
              ),
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon: Icon(
                      widget.goBack == true ? Icons.arrow_back : Icons.widgets,
                      size: MediaQuery.of(context).size.height > 400
                          ? MediaQuery.of(context).size.height * 0.035
                          : 32,
                    ),
                    onPressed: () {
                      widget.goBack == true
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
                              barrierDismissible:
                                  false, // user must tap button!
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
            ),
            drawer: DefaultDrawer(),
            endDrawer: SecondDrawer(),
            body: Container(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height,
              constraints:
                  BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              decoration: BoxDecoration(
                color: widget.backgroundColor != null
                    ? widget.backgroundColor
                    : null,
                image: widget.backgroundColor == null
                    ? DecorationImage(
                        image: AssetImage("assets/images/background.png"),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        gradient: kDefaultLinearGradient,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                          bottomRight: Radius.circular(36),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              widget.title != null ? widget.title : "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height >
                                              400
                                          ? MediaQuery.of(context).size.height *
                                              0.035
                                          : 24),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: widget.child != null
                          ? widget.child
                          : SizedBox(
                              height: 0,
                            ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: widget.bottomNavigationBar,
          ),
        ),
      ),
    );
  }
}
