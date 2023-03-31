import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/models/noteModel.dart';
import 'package:flutter_note/services/database.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:waveui/waveui.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class ShowNote extends StatelessWidget {
  final NoteModel noteData;
  final int index;
  ShowNote({this.noteData, this.index});
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = noteData.title;
    bodyController.text = noteData.body;
    var formattedDate =
        DateFormat.yMMMd().format(noteData.creationDate.toDate());
    var time = DateFormat.jm().format(noteData.creationDate.toDate());
    return Scaffold(
        appBar: WaveAppBar(
          iconList: [
            IconButton(
              onPressed: () {
                showDeleteDialog(context, noteData);
              },
              icon: Icon(FluentIcons.delete_28_regular),
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(
              16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text("$formattedDate at $time"),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: titleController,
                          maxLines: null,
                          decoration: InputDecoration.collapsed(
                            hintText: "Title",
                          ),
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          autofocus: true,
                          controller: bodyController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration.collapsed(
                            hintText: "Type something...",
                          ),
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (titleController.text != noteData.title ||
                bodyController.text != noteData.body) {
              Database().updateNote(authController.user.uid,
                  titleController.text, bodyController.text, noteData.id);
              Get.back();
              titleController.clear();
              bodyController.clear();
            } else {
              showSameContentDialog(context);
            }
          },
          label: Text("Save"),
          icon: Icon(Icons.save),
        ));
  }
}

void showDeleteDialog(BuildContext context, noteData) {
  final AuthController authController = Get.find<AuthController>();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return WaveDialog(
        titleText: "Delete Note?",
        messageText: "Are you sure you want to delete this note?",
        actionsText: [
          "Yes",
          "No",
        ],
        indexedActionCallback: (index) {
          switch (index) {
            case 0:
              Get.back();
              Database().delete(authController.user.uid, noteData.id);
              Get.back(closeOverlays: true);
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

void showSameContentDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Text(
          "No change in content!",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: Text("There is no change in content.",
            style: Theme.of(context).textTheme.titleMedium),
        actions: <Widget>[
          TextButton(
            child: Text(
              "Okay",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    },
  );
}
