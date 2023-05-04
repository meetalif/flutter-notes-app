import 'package:flutter_note/screens/settings/widgets/list_tile.dart';
import 'package:waveui/waveui.dart';

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
          Divider(),
          ListTileSetting(
            onTap: () {
              Get.changeThemeMode(ThemeMode.light);
            },
            title: "Light Mode",
            iconData: FluentIcons.brightness_high_28_regular,
          ),
          Divider(),
          ListTileSetting(
            iconData: FluentIcons.dark_theme_24_regular,
            onTap: () {
              Get.changeThemeMode(ThemeMode.dark);
            },
            title: "Dark Mode",
          ),
          Divider(),
        ],
      ),
    );
  }
}
