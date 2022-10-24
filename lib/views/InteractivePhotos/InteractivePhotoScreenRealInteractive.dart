import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'dart:ui' as ui;

class InteractivePhotoScreen extends StatefulWidget {
  @override
  _InteractivePhotoScreenState createState() => _InteractivePhotoScreenState();
}

class _InteractivePhotoScreenState extends State<InteractivePhotoScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultView(
      title: "Interactive Photo",
      child:
          // CustomPaint(
          //   painter: CurvePainter(),
          //   child: Center(
          //     child: SizedBox(),
          //   ),
          // ),
          Container(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.bottom -
            MediaQuery.of(context).padding.top -
            AppBar().preferredSize.height -
            50,
        alignment: Alignment.center,
        child: Stack(
          children: [
            InteractiveViewer(
              child: Image.asset("assets/images/image.jpeg"),
              maxScale: 5,
            ),
            CustomPin(
              lineStart: [200, 30],
              lineEnd: [220, 230],
            ),
            // CustomPin(
            //   lineStart: [150, 80],
            //   lineEnd: [30, 60],
            // ),
            CustomPinsGroup(
              alignment: "vertical",
              pinsList: [
                [350, 120, 100, 160],
                [350, 100, 100, 200],
                [350, 150, 100, 20]
              ],
            ),
            CustomPinsGroup(
              alignment: "vertical",
              pinsList: [
                [40, 120, 120, 160],
                [60, 100, 160, 140],
                [80, 150, 130, 20]
              ],
            ),
            // CustomPinsGroup(
            //   alignment: "horizontal",
            //   pinsList: [
            //     [259, 100, 250, 90],
            //     [180, 70, 180, 120],
            //     [200, 60, 240, 120]
            //   ],
            // ),
            // CustomPinsGroup(
            //   alignment: "horizontal",
            //   pinsList: [
            //     [259, 200, 100, 100],
            //     [180, 200, 80, 150],
            //     [200, 200, 200, 130]
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class DescriptionAlert extends StatelessWidget {
  const DescriptionAlert({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.close),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TranslationListItem(
                language: "LA",
                translation: "Fructus",
              ),
              TranslationListItem(
                language: "DE",
                translation: "Frucht",
              ),
              TranslationListItem(
                language: "EN",
                translation: "Fruit",
              ),
              TranslationListItem(
                language: "LV",
                translation: "Auglis",
              ),
              TranslationListItem(
                language: "RU",
                translation: "Plod",
              ),
            ],
          )
        ],
      ),
      content: Container(
        child: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}

class CustomPin extends StatelessWidget {
  const CustomPin({
    Key key,
    this.lineStart,
    this.lineEnd,
  }) : super(key: key);
  final List lineStart, lineEnd;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // DescriptionAlert(),
        CustomPaint(
          painter: LinePainter(startPoint: lineStart, endPoint: lineEnd),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: lineStart[1].toDouble() - 10,
            left: lineStart[0].toDouble() - 10,
          ),
          child: GestureDetector(
            onTap: () {
              return showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return DescriptionAlert();
                },
              );
            },
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CustomPinsGroup extends StatelessWidget {
  const CustomPinsGroup({
    Key key,
    this.pinsList,
    this.alignment,
  }) : super(key: key);
  final List pinsList;
  final String alignment;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var lowestHorizontalPoint = size.width;
    var lowestVerticalPoint = size.height;
    var side = "start";
    pinsList
        .map((e) => {
              if (e[0] < lowestHorizontalPoint)
                {
                  e[0] > 60
                      ? lowestHorizontalPoint = e[0].toDouble()
                      : lowestHorizontalPoint = 60,
                },
              if (e[1] < lowestVerticalPoint)
                {
                  e[1] > 60
                      ? lowestVerticalPoint = e[1].toDouble()
                      : lowestVerticalPoint = 60,
                },
            })
        .toList();

    pinsList
        .asMap()
        .map((key, value) => MapEntry(key, {
              if (alignment != "horizontal")
                {
                  pinsList[key][0] = lowestHorizontalPoint.toInt(),
                  print(value[0]),
                  if (value[0] > value[2]) {side = "end"},
                },
              if (alignment == "horizontal")
                {
                  pinsList[key][1] = lowestVerticalPoint.toInt(),
                  if (value[1] > value[3]) {side = "end"},
                }
            }))
        .values
        .toList();

    var firstPointCoordinates = [
          alignment != "horizontal" && lowestHorizontalPoint < 60
              ? 60
              : lowestHorizontalPoint,
          alignment == "horizontal" && lowestVerticalPoint < 60
              ? 60
              : lowestVerticalPoint
        ],
        lastPointCoordinates = firstPointCoordinates;
    List<CustomPin> arr = [];
    pinsList
        .map((e) => {
              alignment == "horizontal" && firstPointCoordinates[0] > e[0]
                  ? firstPointCoordinates = [e[0], firstPointCoordinates[1]]
                  : null,
              alignment != "horizontal" && firstPointCoordinates[1] > e[1]
                  ? firstPointCoordinates = [firstPointCoordinates[0], e[1]]
                  : null,
              alignment == "horizontal" && lastPointCoordinates[0] < e[0]
                  ? lastPointCoordinates = [e[0], firstPointCoordinates[1]]
                  : null,
              alignment != "horizontal" && lastPointCoordinates[1] < e[1]
                  ? lastPointCoordinates = [firstPointCoordinates[0], e[1]]
                  : null,
              arr.add(
                CustomPin(
                  lineStart: [
                    alignment != "horizontal" ? firstPointCoordinates[0] : e[0],
                    alignment == "horizontal" ? lastPointCoordinates[1] : e[1]
                  ],
                  lineEnd: [e[2], e[3]],
                ),
              ),
            })
        .toList();

    return Stack(
      children: [
        for (var item in arr) item,
        alignment == "vertical" && side == "start"
            ? CustomPaint(
                painter: PathPainter(pathPoints: [
                  [
                    firstPointCoordinates[0] + 10,
                    firstPointCoordinates[1] - 20
                  ],
                  [
                    firstPointCoordinates[0] - 20,
                    firstPointCoordinates[1] - 20
                  ],
                  [
                    lastPointCoordinates[0] - 20,
                    lastPointCoordinates[1] + 20,
                  ],
                  [
                    lastPointCoordinates[0] + 10,
                    lastPointCoordinates[1] + 20,
                  ],
                ]),
              )
            : alignment != "horizontal" && side != "start"
                ? CustomPaint(
                    painter: PathPainter(pathPoints: [
                      [
                        firstPointCoordinates[0] - 10,
                        firstPointCoordinates[1] - 20
                      ],
                      [
                        firstPointCoordinates[0] + 20,
                        firstPointCoordinates[1] - 20
                      ],
                      [
                        lastPointCoordinates[0] + 20,
                        lastPointCoordinates[1] + 20,
                      ],
                      [
                        lastPointCoordinates[0] - 10,
                        lastPointCoordinates[1] + 20,
                      ],
                    ]),
                  )
                : alignment == "horizontal" && side == "start"
                    ? CustomPaint(
                        painter: PathPainter(pathPoints: [
                          [
                            firstPointCoordinates[0] - 20,
                            firstPointCoordinates[1] + 10,
                          ],
                          [
                            firstPointCoordinates[0] - 20,
                            firstPointCoordinates[1] - 20,
                          ],
                          [
                            lastPointCoordinates[0] + 20,
                            firstPointCoordinates[1] - 20,
                          ],
                          [
                            lastPointCoordinates[0] + 20,
                            firstPointCoordinates[1] + 10,
                          ],
                        ]),
                      )
                    : alignment == "horizontal" && side != "start"
                        ? CustomPaint(
                            painter: PathPainter(pathPoints: [
                              [
                                firstPointCoordinates[0] - 20,
                                firstPointCoordinates[1] - 10,
                              ],
                              [
                                firstPointCoordinates[0] - 20,
                                firstPointCoordinates[1] + 20,
                              ],
                              [
                                lastPointCoordinates[0] + 20,
                                firstPointCoordinates[1] + 20,
                              ],
                              [
                                lastPointCoordinates[0] + 20,
                                firstPointCoordinates[1] - 10,
                              ],
                            ]),
                          )
                        : SizedBox(),
        alignment == "vertical"
            ? CustomPin(
                lineStart: [
                  side == "start"
                      ? lastPointCoordinates[0] - 40
                      : lastPointCoordinates[0] + 40,
                  (lastPointCoordinates[1] - firstPointCoordinates[1] + 30) /
                          2 +
                      firstPointCoordinates[1] -
                      10
                ],
                lineEnd: [
                  side == "start"
                      ? lastPointCoordinates[0] - 20
                      : lastPointCoordinates[0] + 20,
                  (lastPointCoordinates[1] - firstPointCoordinates[1] + 10) /
                          2 +
                      firstPointCoordinates[1]
                ],
              )
            : alignment == "horizontal"
                ? CustomPin(
                    lineStart: [
                      (lastPointCoordinates[0] -
                                  firstPointCoordinates[0] +
                                  30) /
                              2 +
                          firstPointCoordinates[0] -
                          10,
                      side == "start"
                          ? lastPointCoordinates[1] - 40
                          : lastPointCoordinates[1] + 40
                    ],
                    lineEnd: [
                      (lastPointCoordinates[0] -
                                  firstPointCoordinates[0] +
                                  30) /
                              2 +
                          firstPointCoordinates[0] -
                          10,
                      side == "start"
                          ? lastPointCoordinates[1] - 20
                          : lastPointCoordinates[1] + 20
                    ],
                  )
                : SizedBox(),
      ],
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  const LinePainter({Key key, this.startPoint, this.endPoint});
  final List startPoint, endPoint;
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.amber;
    paint.strokeWidth = 5;

    canvas.drawLine(
      Offset((startPoint[0]).toDouble(), (startPoint[1]).toDouble()),
      Offset(endPoint[0].toDouble(), endPoint[1].toDouble()),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class PathPainter extends CustomPainter {
  @override
  const PathPainter({Key key, this.pathPoints});
  final List pathPoints;
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.amber;
    paint.strokeWidth = 5;

    paint.style = PaintingStyle.stroke;
    var path = Path();
    pathPoints
        .asMap()
        .map(
          (key, value) => MapEntry(
            key,
            key == 0
                ? path.moveTo(value[0].toDouble(), value[1].toDouble())
                : path.lineTo(value[0].toDouble(), value[1].toDouble()),
          ),
        )
        .values
        .toList();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class TranslationListItem extends StatelessWidget {
  const TranslationListItem({
    Key key,
    this.language,
    this.translation,
  }) : super(key: key);
  final String language, translation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            language.length == 2 ? "   " + "${language}: " : "${language}: ",
            style: TextStyle(
              fontSize: 24,
              color: kSecondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Flexible(
            child: Text(
              "${translation}",
              style: TextStyle(
                fontSize: 24,
                color: kDefaultColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
