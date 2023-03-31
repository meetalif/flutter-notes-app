import 'package:flutter/material.dart';
import 'package:flutter_note/screens/settings/widgets/list_tile.dart';
import 'package:get/get.dart';
import 'package:waveui/waveui.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class DarkMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WaveAppBar(
        title: "Appearance",
      ),
      body: Column(
        children: [
          ListTileSetting(
              onTap: () {
                Get.changeThemeMode(ThemeMode.system);
              },
              title: "Use device setting",
              iconData: FluentIcons.system_24_regular,
              subtitle: Text(
                "Auttomatically swtich between Light and Dark themes when your system does",
              )),
          WaveLine(),
          ListTileSetting(
            onTap: () {
              Get.changeThemeMode(ThemeMode.light);
            },
            title: "Light Mode",
            iconData: FluentIcons.brightness_high_28_regular,
            subtitle: null,
          ),
          WaveLine(),
          ListTileSetting(
            iconData: FluentIcons.dark_theme_24_regular,
            onTap: () {
              Get.changeThemeMode(ThemeMode.dark);
            },
            title: "Dark Mode",
            subtitle: null,
          ),
          WaveLine(),
        ],
      ),
    );
  }
}
