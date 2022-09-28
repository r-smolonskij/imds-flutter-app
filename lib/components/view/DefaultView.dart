import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/LanguageChooseModal.dart';
import 'package:flutterTestApp/components/view/DefaultDrawer.dart';
import 'package:flutterTestApp/components/view/SecondDrawer.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/views/LoginScreen.dart';

class DefaultView extends StatefulWidget {
  const DefaultView(
      {Key key, this.title, this.child, this.bottomNavigationBar, this.goBack})
      : super(key: key);

  final String title;
  final Widget child;
  final Widget bottomNavigationBar;
  final bool goBack;

  @override
  _DefaultViewState createState() => _DefaultViewState();
}

class _DefaultViewState extends State<DefaultView> {
  
  hideKeyboard(){
    print(11);
    FocusScope.of(context).requestFocus(new FocusNode());
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
                                  ? MediaQuery.of(context).size.height * 0.035
                                  : 32,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                            child: Icon(
                              Icons.login,
                              size: MediaQuery.of(context).size.height > 400
                                  ? MediaQuery.of(context).size.height * 0.035
                                  : 32,
                            ),
                          ),
                        ),
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
                image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover,
                ),
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
                                      fontSize:
                                          MediaQuery.of(context).size.height > 400
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height *
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
