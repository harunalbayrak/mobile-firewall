import 'package:flutter/material.dart';
import 'package:graduation_app/widgets/build_background.dart';
import 'package:graduation_app/constants/env.dart';
import 'package:graduation_app/widgets/list_tiles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:graduation_app/widgets/app_bar_only_dots.dart';

class BackupSettings extends StatefulWidget {
  const BackupSettings({Key? key}) : super(key: key);

  @override
  _BackupSettingsState createState() => _BackupSettingsState();
}

class _BackupSettingsState extends State<BackupSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOnlyDots(context, 'mm6'.tr()),
      body: Stack(
        children: [
          buildBackground(),
          buildContainer(),
        ],
      ),
    );
  }

  Widget buildContainer() {
    return Container(
      padding: EdgeInsets.zero,
      decoration: blackGrayDecoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildListTile6(context, 'st3'.tr(), Icons.dangerous, 0),
        ],
      ),
    );
  }
}
