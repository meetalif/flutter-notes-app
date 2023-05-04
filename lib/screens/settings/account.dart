import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/userController.dart';
import 'package:waveui/waveui.dart';

class Account extends StatelessWidget {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WaveAppBar(title: "Account"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text("Hi, ${userController.user.name}!"),
              subtitle: Row(
                children: [
                  Icon(
                    FluentIcons.mail_16_filled,
                    size: 18,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("${userController.user.email}"),
                ],
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                showSignOutDialog(context);
              },
              title: Text("Logout"),
              leading: Icon(FluentIcons.power_28_regular),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

void showSignOutDialog(BuildContext context) async {
  final AuthController authController = Get.find<AuthController>();
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Are you sure you want to log out?"),
        content: Text(
            'Your notes are already saved so when logging back your noteswill be there.'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              authController.signout();
              Get.close(2);
            },
            child: Text("Log Out"),
          ),
        ],
      );
    },
  );
}
