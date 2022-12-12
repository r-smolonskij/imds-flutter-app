import 'package:flutter/material.dart';
import 'package:flutterTestApp/components/Loader.dart';
import 'package:flutterTestApp/components/view/CustomAppBar.dart';
import 'package:flutterTestApp/components/view/DefaultView.dart';
import 'package:flutterTestApp/constants.dart';
import 'package:flutterTestApp/sqlite/database_helper.dart';
import 'package:flutterTestApp/sqlite/translation.dart';
import 'package:flutterTestApp/views/SingleTranslationScreen.dart';
import 'package:graphview/GraphView.dart';

class SemanticTreeScreen extends StatefulWidget {
  const SemanticTreeScreen({Key key, this.translation}) : super(key: key);
  final Translation translation;

  @override
  State<SemanticTreeScreen> createState() => _SemanticTreeScreenState();
}

class _SemanticTreeScreenState extends State<SemanticTreeScreen> {
  DatabaseHelper dbHelper = DatabaseHelper();
  var isLoading = true;
  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  List<Translation> allTranslations = [];
  Widget rectangleWidget(latinTranslation) {
    var foundTranslation = allTranslations
        .firstWhere((translation) => translation.la == latinTranslation);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleTranslationScreen(foundTranslation.id),
          ),
        );
      },
      child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            boxShadow: [
              BoxShadow(
                color: colorsByGroupType[foundTranslation.notes],
                spreadRadius: 1,
              ),
            ],
          ),
          child: Text(
            "${latinTranslation}",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          )),
    );
  }

  getRootTranslation() async {
    var rootLatinName;
    var translationItem;
    if (widget.translation.root == "is_root") {
      rootLatinName = widget.translation.la;
      translationItem = widget.translation;
    } else {
      var isRootFound = false;
      var currentRootLatinTitle = widget.translation.la;
      var counter = 0;
      //counter is ment if something is wrong with data
      while (!isRootFound && counter < 5) {
        counter++;
        var parent = await getParentTranslation(currentRootLatinTitle);
        if (parent.runtimeType != String) {
          rootLatinName = parent.la;
          translationItem = parent;
          isRootFound = true;
        } else {
          currentRootLatinTitle = parent;
        }
      }
    }
    if (translationItem != null) {
      setState(() {
        allTranslations = [translationItem];
      });
    }
    return rootLatinName;
  }

  getParentTranslation(latinName) async {
    var parent;
    var translation = await dbHelper.getTranslationByLatinName(latinName);
    if (translation != null) {
      if (translation.root == null || translation.root == "is_root") {
        parent = translation;
      } else {
        parent = translation.root;
      }
    }
    return parent;
  }

  getChildrenTranslations(parentLatinName) async {
    var translations = await dbHelper
        .getSemanticTranslationsByParentLatinName(parentLatinName);
    return translations;
  }

  getData() async {
    var result;
    var rootLatinName = await getRootTranslation();
    if (rootLatinName != null) {
      result = await getTreeData(rootLatinName);
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          isLoading = false;
        });
      });
    }
    return result;
  }

  getTreeData(rootLatinName) async {
    List<Translation> translationsList = [...allTranslations];
    final rootNode = Node.Id(rootLatinName);
    var firstStageTranslations = await getChildrenTranslations(rootLatinName);
    var relationships = [];
    await Future.forEach(firstStageTranslations, (firstStageTranslation) async {
      translationsList.add(firstStageTranslation);
      final firstStageNode = Node.Id(firstStageTranslation.la);
      graph.addEdge(rootNode, firstStageNode);
      var secondStageTranslations =
          await getChildrenTranslations(firstStageTranslation.la);
      await Future.forEach(secondStageTranslations,
          (secondStageTranslation) async {
        translationsList.add(secondStageTranslation);
        final secondStageNode = Node.Id(secondStageTranslation.la);
        graph.addEdge(firstStageNode, secondStageNode);
      });
    });
    setState(() {
      allTranslations = translationsList;
    });
    return relationships;
  }

  onInit() async {
    await getData();
    builder
      ..siblingSeparation = (50)
      ..levelSeparation = (50)
      ..subtreeSeparation = (50)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }

  @override
  void initState() {
    onInit();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? DefaultView(
            child: Loader(),
          )
        : Scaffold(
            backgroundColor: imagesBackgroundColor,
            appBar: CustomAppBar(
              goBack: true,
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Center(
                      child: InteractiveViewer(
                          constrained: false,
                          boundaryMargin: EdgeInsets.all(100),
                          minScale: 0.01,
                          maxScale: 1,
                          child: Center(
                            child: GraphView(
                              graph: graph,
                              algorithm: BuchheimWalkerAlgorithm(
                                  builder, TreeEdgeRenderer(builder)),
                              paint: Paint()
                                ..color = Colors.black
                                ..strokeWidth = 3
                                ..style = PaintingStyle.stroke,
                              builder: (Node node) {
                                // I can decide what widget should be shown here based on the id
                                var a = node.key.value;
                                return rectangleWidget(a);
                              },
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ));
  }
}
