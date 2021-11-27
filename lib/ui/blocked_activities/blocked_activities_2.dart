import 'package:flutter/material.dart';
import 'package:graduation_app/constants/box_decorations.dart';
import 'package:graduation_app/widgets/build_background.dart';

class BlockedActivities2 extends StatefulWidget {
  BlockedActivities2({Key? key}) : super(key: key);

  @override
  _BlockedActivities2State createState() => _BlockedActivities2State();
}

class _BlockedActivities2State extends State<BlockedActivities2> {
  final titles = ["List 1", "List 2", "List 3"];
  final subtitles = [
    "Here is list 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle"
  ];
  final double paddingListTileLR = 12.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blocked Activities')),
      body: Stack(
        children: [
          buildBackground(),
          buildListView(),
        ],
      ),
    );
  }

  Widget buildListView() {
    return Container(
      decoration: classicBlackGray,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("ASD"),
          Text("ASD"),
        ],
      ),
    );
  }
}
