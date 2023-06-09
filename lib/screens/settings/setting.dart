import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/screens/settings/account.dart';
import 'package:flutter_note/screens/settings/dark_mode.dart';
import 'package:flutter_note/screens/settings/widgets/list_tile.dart';
import 'package:waveui/waveui.dart';

class Setting extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WaveAppBar(
        title: "Settings",
      ),
      body: Column(
        children: [
          ListTileSetting(
            onTap: () {
              Get.to(() => Account());
            },
            title: "Account",
            iconData: FluentIcons.person_28_regular,
          ),
          Divider(),
          ListTileSetting(
            onTap: () {
              Get.to(() => DarkMode());
            },
            title: "Dark Mode",
            iconData: FluentIcons.dark_theme_24_regular,
          ),
          Divider(),
        ],
      ),
    );
  }
}
