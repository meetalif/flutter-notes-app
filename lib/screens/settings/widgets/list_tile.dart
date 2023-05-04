import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class ListTileSetting extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final IconData iconData;
  final Widget? subtitle;

  ListTileSetting(
      {required this.title, required this.iconData, this.onTap, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.white,
          onTap: onTap,
          leading: Icon(iconData),
          title: Text(title),
          trailing: Icon(FluentIcons.chevron_right_28_regular),
          subtitle: subtitle,
        ),
      ],
    );
  }
}
