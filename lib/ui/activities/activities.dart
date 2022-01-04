import 'package:flutter/material.dart';
import 'package:graduation_app/ui/activities/activities_2.dart';
import 'package:graduation_app/constants/env.dart';
import 'package:graduation_app/constants/paddings.dart';
import 'package:graduation_app/constants/text_styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:graduation_app/utils/page_route_utils.dart';
import 'package:graduation_app/widgets/build_background.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:graduation_app/widgets/app_bar_only_dots.dart';

class Activities extends StatefulWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  double textSize2 = 10;

  final titles = ["List 1", "List 2", "List 3"];
  final subtitles = [
    "Here is list 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOnlyDots(context, 'hp4'.tr()),
      body: Stack(
        children: [
          buildBackground(),
          buildListView(),
        ],
      ),
    );
  }

  Widget buildListView() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.zero,
            decoration: blackGrayDecoration,
            child: buildListTiles(index),
          );
        },
      ),
    );
  }

  Widget buildListTiles(index) {
    return ListTile(
      onTap: () {
        pageRoute(context, "/blocked_activities2", const Activities2());
      },
      contentPadding: padding3,
      title: AutoSizeText(titles[index], style: textStyle2(textSize2)),
      subtitle: AutoSizeText(subtitles[index], style: textStyle2(textSize2)),
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
            "https://images.unsplash.com/photo-1547721064-da6cfb341d50"),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          activitiesBlockIcon,
          color: activitiesIconColor,
        ),
      ),
    );
  }
}
