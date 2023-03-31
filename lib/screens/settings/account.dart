import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/userController.dart';
import 'package:get/get.dart';
import 'package:waveui/waveui.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

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
            WaveLine(),
            ListTile(
              onTap: () {
                showSignOutDialog(context);
              },
              title: Text("Logout"),
              leading: Icon(FluentIcons.power_28_regular),
            ),
            WaveLine(),
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
      return WaveDialog(
        titleText: "Are you sure you want to log out?",
        messageText:
            'Your notes are already saved so when logging back your noteswill be there.',
        actionsText: [
          'Log Out',
          'Cancel',
        ],
        indexedActionCallback: (index) {
          switch (index) {
            case 0:
              Get.back();
              authController.signout();
              Get.close(2);
              break;
            case 1:
              Navigator.of(context).pop();
              break;
            default:
          }
        },
      );
    },
  );
}
